import 'package:flutter/material.dart';
import 'package:habittracker/models/habit_date_model.dart';

List<DateTime> getDateList(DateTime firstDate, DateTime lastDate) {
  List<DateTime> list = [];
  int count = daysCount(toDMY(firstDate), toDMY(lastDate));
  for (int i = 0; i < count; i++) {
    list.add(toDMY(firstDate).add(Duration(days: i)));
  }

  return list;
}

DateTime toDMY(DateTime dateTime) {
  return DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
}

int daysCount(DateTime first, DateTime last) =>
    last.difference(first).inDays + 1;

String weekdayToISOString(int weekday, int noOfLetters) {
  List<String> weekdays3 = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> weekdays1 = ["M", "T", "W", "T", "F", "S", "S"];
  return noOfLetters == 1 ? weekdays1[weekday - 1] : weekdays3[weekday - 1];
}

String monthToISOString(int month) {
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return months[month - 1];
}

Color getDateIconColor(HabitDateModel habitDate) {
  switch (habitDate.activity) {
    case "Completed":
      {
        return const Color(0xFFB3D264);
      }

    case "Uncompleted":
      {
        return const Color(0xFFE85F4D);
      }
    case null:
      {
        return Colors.transparent;
      }
  }

  return Colors.white;
}

List<HabitDateModel> getWeeksHabitDates(
    DateTime currentWeekStartDate, List<HabitDateModel> habitHistory) {
  List<HabitDateModel> thisWeekHabitHistory = [];

  for (var habitDate in habitHistory.reversed) {
    if (habitDate.date.compareTo(currentWeekStartDate) < 0) {
      return thisWeekHabitHistory;
    }
    thisWeekHabitHistory.add(habitDate);
  }

  return thisWeekHabitHistory;
}
