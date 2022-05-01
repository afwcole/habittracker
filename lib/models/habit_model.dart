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
}
