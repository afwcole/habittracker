import 'package:habittracker/functions/date_helper.dart';

import 'habit_date_model.dart';

class HabitModel {
  final int habitID;
  final String habitName;
  final String frequencyType;
  final DateTime startDate;
  final List<int> selectedFrequencyDays;
  final List<HabitDateModel> habitHistory;
  final bool notification;

  HabitModel(this.habitID, this.habitName, this.frequencyType, this.startDate,
      this.selectedFrequencyDays, this.habitHistory, this.notification);

  HabitDateModel getDateInHistory(DateTime date) {
    DateTime dayMonthYear = toDMY(date);
    return habitHistory
        .firstWhere((habitDate) => habitDate.date.compareTo(dayMonthYear) == 0);
  }
}
