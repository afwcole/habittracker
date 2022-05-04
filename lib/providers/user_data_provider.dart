import 'package:flutter/material.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit_model.dart';

class UserDataProvider extends ChangeNotifier {
  final List<HabitModel> _habitList = [
    HabitModel(
      1,
      "Eat Breakfast",
      "Daily",
      DateTime.utc(2022, 4, 24),
      [1, 2, 3, 4, 6],
      {
        DateTime.utc(2022, 4, 15): "Uncompleted",
        DateTime.utc(2022, 4, 16): "Completed",
        DateTime.utc(2022, 4, 17): "Completed",
        DateTime.utc(2022, 4, 18): "Completed",
        DateTime.utc(2022, 4, 19): "Completed",
        DateTime.utc(2022, 4, 20): "Completed",
        DateTime.utc(2022, 4, 21): "Completed",
        DateTime.utc(2022, 4, 22): "Completed",
        DateTime.utc(2022, 4, 24): "Completed",
        DateTime.utc(2022, 4, 25): "Uncompleted",
        DateTime.utc(2022, 4, 26): "Completed",
        DateTime.utc(2022, 4, 27): "Completed",
        DateTime.utc(2022, 4, 28): "Uncompleted",
        DateTime.utc(2022, 4, 29): "Completed",
        DateTime.utc(2022, 4, 30): "Completed",
        toDMY(DateTime.now()): null,
      },
      true,
    ),
  ];

  List<HabitModel> get habitList => _habitList;

  void updateHabitHistory(HabitModel habit, DateTime date, String updateValue) {
    _habitList.firstWhere((element) => element == habit).habitHistory[date] =
        updateValue;
    notifyListeners();
  }

  void addHabitToList(String habitName, String selectedOptions,
      List<int> selectedDays, bool notificationSwitch) {
    _habitList.add(
      HabitModel(
          _habitList.length,
          habitName,
          selectedOptions,
          DateTime.now(),
          selectedDays,
          {
            DateTime.utc(2022, 4, 25): "Uncompleted",
            DateTime.utc(2022, 4, 26): "Completed",
            DateTime.utc(2022, 4, 27): "Break",
          },
          notificationSwitch),
    );

    notifyListeners();
  }
}
