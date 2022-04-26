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

  static List<HabitModel> fetchAll() {
    return [
      HabitModel(
        1,
        "Morning Workout",
        "Daily",
        DateTime(2022, 4, 16),
        [0, 1, 2, 3, 4],
        [
          HabitDateModel(DateTime.utc(2022, 4, 17), "Uncompleted"),
          HabitDateModel(DateTime.utc(2022, 4, 18), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 19), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 20), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 21), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 22), "Uncompleted"),
          HabitDateModel(DateTime.utc(2022, 4, 23), "Break"),
          HabitDateModel(DateTime.utc(2022, 4, 24), "Break"),
          HabitDateModel(DateTime.utc(2022, 4, 25), "Completed"),
        ],
        false,
      ),
      HabitModel(
        2,
        "Study for Exam",
        "Weekly",
        DateTime(2022, 4, 10),
        [0, 1, 2, 3, 4],
        [
          HabitDateModel(DateTime.utc(2022, 4, 11), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 12), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 13), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 14), "Uncompleted"),
          HabitDateModel(DateTime.utc(2022, 4, 15), "Break"),
          HabitDateModel(DateTime.utc(2022, 4, 16), "Break"),
          HabitDateModel(DateTime.utc(2022, 4, 17), "Uncompleted"),
          HabitDateModel(DateTime.utc(2022, 4, 18), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 19), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 20), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 21), "Completed"),
          HabitDateModel(DateTime.utc(2022, 4, 22), "Uncompleted"),
          HabitDateModel(DateTime.utc(2022, 4, 23), "Break"),
        ],
        false,
      ),
      HabitModel(
        3,
        "Brush Teeth",
        "Daily",
        DateTime(2022, 3, 1),
        [0, 1, 2, 3, 4],
        [
          HabitDateModel(DateTime.utc(2022, 3, 1), "Completed"),
          HabitDateModel(DateTime.utc(2022, 3, 2), "Completed"),
          HabitDateModel(DateTime.utc(2022, 3, 3), "Completed"),
          HabitDateModel(DateTime.utc(2022, 3, 4), "Break"),
          HabitDateModel(DateTime.utc(2022, 3, 5), "Completed"),
          HabitDateModel(DateTime.utc(2022, 3, 6), "Uncompleted"),
          HabitDateModel(DateTime.utc(2022, 3, 7), "Completed"),
          HabitDateModel(DateTime.utc(2022, 3, 8), "Completed"),
        ],
        false,
      ),
    ];
  }
}
