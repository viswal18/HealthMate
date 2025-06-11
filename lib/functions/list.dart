import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zynapsemed/main.dart';
import 'package:zynapsemed/model/model.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

ValueNotifier<List<model>> mednotifier = ValueNotifier([]);

void addmodel(model value) async {
  final modelDB = await Hive.openBox<model>('model_db');
  await modelDB.add(value); // Add to Hive first
  mednotifier.value =
      modelDB.values.toList(); // Update notifier with fresh data from Hive
  mednotifier.notifyListeners();

  // Parse the medication time into DateTime
  final currentDate = DateTime.now();
  final String timeString = value.time;

  // Split the time string into hours and minutes
  final List<String> timeParts = timeString.split(":");
  if (timeParts.length != 2) {
    print("Invalid time format: $timeString");
    return;
  }

  // Extract hours and minutes
  int hour = int.parse(timeParts[0].trim());
  int minute = int.parse(timeParts[1].split(" ")[0].trim());

  // Handle AM/PM if present
  if (timeString.toLowerCase().contains("pm") && hour != 12) {
    hour += 12; // Convert to 24-hour format
  } else if (timeString.toLowerCase().contains("am") && hour == 12) {
    hour = 0; // Convert 12 AM to 0 hours
  }

  DateTime medicineTime = DateTime(
    currentDate.year,
    currentDate.month,
    currentDate.day,
    hour, // Hour
    minute, // Minute
  );

  // If the scheduled time is before the current time, set it to the same time on the next day
  if (medicineTime.isBefore(currentDate)) {
    medicineTime = medicineTime.add(Duration(days: 1));
  }

  print("Medicine Time: $medicineTime");

  // Schedule notification for medicine time
  scheduleMedicineReminder(
      modelDB.length - 1, // ID of the notification (index as ID)
      "Medicine Reminder",
      "Time to take ${value.medicationname}",
      medicineTime);
}

Future<void> getalldata() async {
  final modelDB = await Hive.openBox<model>('model_db');
  mednotifier.value.clear();
  mednotifier.value.addAll(modelDB.values);
  mednotifier.notifyListeners();
}

Future<void> deletedata(int index) async {
  final modelDB = await Hive.openBox<model>('model_db');
  await modelDB.deleteAt(index); // Delete from Hive
  mednotifier.value =
      modelDB.values.toList(); // Update notifier with fresh data from Hive
  mednotifier.notifyListeners();
}

Future<void> scheduleMedicineReminder(
    int id, String title, String body, DateTime scheduledTime) async {
  print("Scheduling reminder for: $title at $scheduledTime");

  // Convert scheduledTime to local time zone
  final tz.TZDateTime tzScheduledTime =
      tz.TZDateTime.from(scheduledTime, tz.local);

  print("Scheduled Time (Local): $tzScheduledTime");

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tzScheduledTime,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'med_reminder_channel',
        'Medicine Reminders',
        channelDescription: 'Reminds users to take their medicine',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      ),
    ),
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  );
}
