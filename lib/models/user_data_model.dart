import 'package:flutter/material.dart';
import 'package:habittracker/models/habit_date_model.dart';
import 'package:habittracker/models/habit_model.dart';

class UserDataModel extends ChangeNotifier {
  List<HabitModel> habitList = [];

  addHabitToList() {
    HabitModel habitModel = HabitModel(
        4,
        "Record Youtube Video",
        "Weekly",
        DateTime.now(),
        [0, 2, 4, 6],
        [
          HabitDateModel(DateTime.now(), "Null"),
        ],
        true);

    habitList.add(habitModel);

    notifyListeners();
  }
}
