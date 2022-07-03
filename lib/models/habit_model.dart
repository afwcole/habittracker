import 'dart:collection';
import 'dart:convert';

import 'package:habittracker/providers/app_data_provider.dart';

class HabitModel {
  final int habitID;
  String habitName;
  DateTime startDate;
  List selectedBreakDays;
  Map habitHistory;
  bool notification;

  HabitModel(this.habitID, this.habitName, this.startDate,
      this.selectedBreakDays, this.habitHistory, this.notification);

  void sortHabitHistory() {
    final Map fromMap = SplayTreeMap.from(habitHistory);
    habitHistory = fromMap;
  }

  void clearHabitHistory() {
    habitHistory.clear();
  }

  void padHabitHistory() {
    DateTime addThisDate;

    if (habitHistory.isEmpty) return;

    DateTime lastRecordedDate = habitHistory.entries.last.key;
    int daysBetweenLastAndNow =
        AppDataProvider().today.difference(lastRecordedDate).inDays;
    for (int i = 1; i <= daysBetweenLastAndNow - 1; i++) {
      addThisDate = lastRecordedDate.add(Duration(days: i));
      habitHistory.addAll({
        addThisDate: selectedBreakDays.contains(addThisDate.weekday - 1)
            ? "Break"
            : "Uncompleted"
      });
    }
  }

  //From JSON
  HabitModel.fromJson(Map<String, dynamic> json)
      : habitID = json['habitID'],
        habitName = json['habitName'],
        startDate = DateTime.parse(json['startDate'] ?? ''),
        selectedBreakDays = json['selectedFrequencyDays'],
        habitHistory = jsonDecode(
          json["habitHistory"],
        ).map((key, value) {
          return MapEntry(DateTime.parse(key), value);
        }),
        notification = json['notification'];

  //Convert ot JSON
  Map<String, dynamic> toJson() => {
        'habitID': habitID,
        'habitName': habitName,
        'startDate': startDate.toIso8601String(),
        'selectedFrequencyDays': selectedBreakDays,
        'habitHistory': jsonEncode(habitHistory, toEncodable: (input) {
          return habitHistory
              .map((key, value) => MapEntry(key.toIso8601String(), value));
        }),
        'notification': notification,
      };

  Map<String, int> getStatsInRange(int range) {
    int _historyLength = habitHistory.entries.length;
    int _rangeCalculated = _historyLength > range ? range : _historyLength;
    int _completedCount = 0;
    int _uncompletedCount = 0;
    int _breakCount = 0;

    for (int i = _historyLength - 1;
        i >= _historyLength - _rangeCalculated;
        i--) {
      switch (habitHistory.values.elementAt(i)) {
        case "Completed":
          {
            _completedCount++;
            break;
          }
        case "Uncompleted":
          {
            _uncompletedCount++;
            break;
          }
        case "Break":
          {
            _breakCount++;
            break;
          }
      }
    }

    return {
      "total": _historyLength,
      "range_calculated": _rangeCalculated,
      "completed": _completedCount,
      "uncompleted": _uncompletedCount,
      "break": _breakCount,
    };
  }

  int getCurrentStreak() {
    int _currentCount = 0;
    for (int i = habitHistory.entries.length - 1; i >= 0; i--) {
      if (habitHistory.values.elementAt(i) == "Uncompleted") break;
      _currentCount++;
    }
    return _currentCount;
  }

  int getBestStreak() {
    int _bestCount = 0;
    int _count = 0;
    for (int i = habitHistory.entries.length - 1; i >= 0; i--) {
      if (habitHistory.values.elementAt(i) == "Uncompleted") {
        _count = 0;
      } else {
        _count++;
        if (_count > _bestCount) _bestCount = _count;
      }
    }
    return _bestCount;
  }
}
