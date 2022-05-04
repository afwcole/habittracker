class HabitModel {
  final int habitID;
  final String habitName;
  final String frequencyType;
  final DateTime startDate;
  final List<int> selectedFrequencyDays;
  final Map<DateTime, String?> habitHistory;
  final bool notification;

  HabitModel(this.habitID, this.habitName, this.frequencyType, this.startDate,
      this.selectedFrequencyDays, this.habitHistory, this.notification);

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
