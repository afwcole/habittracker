import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habittracker/models/habit_date.dart';

List<DateTime> getDateList(DateTime firstDate, DateTime lastDate) {
  List<DateTime> list = [];
  int count = daysCount(toDateMonthYear(firstDate), toDateMonthYear(lastDate));
  for (int i = 0; i < count; i++) {
    list.add(toDateMonthYear(firstDate).add(Duration(days: i)));
  }

  return list;
}

DateTime toDateMonthYear(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

int daysCount(DateTime first, DateTime last) =>
    last.difference(first).inDays + 1;

String weekdayToISOString(int weekday, int noOfLetters) {
  List<String> weekdays3 = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> weekdays1 = ["M", "T", "W", "T", "F", "S", "S"];
  return noOfLetters == 1 ? weekdays1[weekday - 1] : weekdays3[weekday - 1];
}

Color getDateIconColor(HabitDate habitDate) {
  switch (habitDate.activity) {
    case "Completed":
      {
        return const Color(0xFFB3D264);
      }

    case "Uncompleted":
      {
        return const Color(0xFFE85F4D);
      }
  }

  return Colors.white;
}
