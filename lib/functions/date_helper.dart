import 'package:flutter/material.dart';

List<DateTime> getWeekDateList() {
  DateTime today = toDMY(DateTime.now());
  DateTime weekStartDate = today.subtract(Duration(days: today.weekday - 1));
  List<DateTime> weekList = [];
  for (int i = 0; i < 7; i++) {
    weekList.add(weekStartDate.add(Duration(days: i)));
  }

  return weekList;
}

DateTime toDMY(DateTime dateTime) {
  return DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
}

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

Color getDateIconColor(String? activity) {
  switch (activity) {
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
