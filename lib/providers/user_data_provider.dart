import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  UserDataProvider() {
    savePreferences();
    loadPreferences();
  }

  List<HabitModel> _habitList = [];

  List<HabitModel> get habitList => _habitList;

  String encodeHabitList() {
    return json.encode(habitList
        .map<Map<String, dynamic>>((habit) => habit.toJson())
        .toList());
  }

  List<HabitModel> decodeHabitList(String encodedHabitList) {
    return (json.decode(encodedHabitList) as List<dynamic>)
        .map<HabitModel>((habit) => HabitModel.fromJson(habit))
        .toList();
  }

  clearHabitList() {
    _habitList.clear();
    savePreferences();
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Serializes List object into String
    String _encodedHabitList = encodeHabitList();
    prefs.setString("habitList", _encodedHabitList);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _encodedHabits = prefs.getString("habitList");

    //use this for testing empty habitlist otherwise remove it Debugging purposes only
    if (false) {
      return;
    }

    if (_encodedHabits != null) {
      //De-serializes into the List Object
      _habitList = decodeHabitList(_encodedHabits);
      for (var habitItem in _habitList) {
        habitItem.padHabitHistory();
      }

      notifyListeners();
      savePreferences();
    }
  }

  void updateHabitHistory(
      HabitModel habit, DateTime date, String updateValue) async {
    habit.habitHistory[date] = updateValue;
    habit.sortHabitHistory();
    notifyListeners();
    savePreferences();
  }

  void addHabitToList(String habitName, DateTime startDate,
      List<int> selectedDays, bool notificationSwitch) async {
    _habitList.add(HabitModel(
        _habitList.length,
        habitName,
        startDate,
        selectedDays,
        {
          DateTime.utc(2022, 4, 25): "Uncompleted",
          DateTime.utc(2022, 4, 26): "Completed",
          DateTime.utc(2022, 4, 27): "Break",
        },
        notificationSwitch));
    _habitList.last.sortHabitHistory();
    notifyListeners();
    savePreferences();
  }
}
