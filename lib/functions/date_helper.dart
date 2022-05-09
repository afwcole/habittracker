import 'package:flutter/material.dart';
import 'package:habittracker/providers/app_data_provider.dart';

List<String> _weekdays3 = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
List<String> _weekdays1 = ["M", "T", "W", "T", "F", "S", "S"];
List<String> _months = [
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
  "December",
];

List<DateTime> getWeekDateList() {
  DateTime today = AppDataProvider().today;
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
  return noOfLetters == 1 ? _weekdays1[weekday - 1] : _weekdays3[weekday - 1];
}

String displayDateStr(DateTime date) {
  return "${_weekdays3[date.weekday - 1]}, ${date.day}th ${_months[date.month - 1]}";
}

String monthToISOString(int month) {
  return _months[month - 1];
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
