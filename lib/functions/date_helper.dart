import 'package:flutter/material.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/theme/theme_constants.dart';

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

List<String> get weekDays1 => _weekdays1;

List<String> get months => _months;

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
  return "${_weekdays3[date.weekday - 1]}, ${date.day} ${_months[date.month - 1]}";
}

String monthToISOString(int month) {
  return _months[month - 1];
}

Color getDateIconColor(String? activity) {
  switch (activity) {
    case "Completed":
      {
        return COLOR_POSITIVE;
      }

    case "Uncompleted":
      {
        return COLOR_NEGATIVE;
      }
    case null:
      {
        return Colors.transparent;
      }
  }

  return Colors.white;
}
