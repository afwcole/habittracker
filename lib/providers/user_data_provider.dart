import 'package:flutter/material.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit_date_model.dart';
import 'package:habittracker/models/habit_model.dart';

class UserDataProvider extends ChangeNotifier {
  final List<HabitModel> _habitList = [
    HabitModel(
      1,
      "Eat Breakfast",
      "Daily",
      DateTime.utc(2022, 4, 24),
      [1, 2, 3, 4, 6],
      [
        HabitDateModel(DateTime.utc(2022, 4, 25), "Uncompleted"),
        HabitDateModel(DateTime.utc(2022, 4, 26), "Completed"),
        HabitDateModel(DateTime.utc(2022, 4, 27), "Completed"),
        HabitDateModel(toDMY(DateTime.now()), null),
      ],
      true,
    ),
  ];

  List<HabitModel> get habitList => _habitList;

  void updateHabitHistory(HabitModel habit, DateTime date, String updateValue) {
    if (habit.selectedFrequencyDays.contains(date.weekday)) {
      _habitList
          .firstWhere((element) => element == habit)
          .getDateInHistory(date)
          .activity = updateValue;
      notifyListeners();
    }
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
          [
            HabitDateModel(DateTime.utc(2022, 4, 25), "Uncompleted"),
            HabitDateModel(DateTime.utc(2022, 4, 26), "Completed"),
            HabitDateModel(DateTime.utc(2022, 4, 27), "Break"),
            HabitDateModel(toDMY(DateTime.now()), null),
          ],
          notificationSwitch),
    );

    notifyListeners();
  }
}
