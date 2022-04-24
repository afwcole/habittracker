import 'habit_date.dart';

class Habit {
  final int habitID;
  final String habitName;
  final String frequencyType;
  final DateTime startDate;
  final List<int> selectedFrequencyDays;
  final List<HabitDate> habitHistory;
  final bool notification;

  Habit(this.habitID, this.habitName, this.frequencyType, this.startDate,
      this.selectedFrequencyDays, this.habitHistory, this.notification);

  static List<Habit> fetchAll() {
    return [
      Habit(
        1,
        "Morning Workout",
        "Daily",
        DateTime(2022, 4, 16),
        [0, 1, 2, 3, 4],
        [
          HabitDate(DateTime(2022, 4, 17), "Uncompleted"),
          HabitDate(DateTime(2022, 4, 18), "Completed"),
          HabitDate(DateTime(2022, 4, 19), "Completed"),
          HabitDate(DateTime(2022, 4, 20), "Completed"),
          HabitDate(DateTime(2022, 4, 21), "Completed"),
          HabitDate(DateTime(2022, 4, 22), "Uncompleted"),
          HabitDate(DateTime(2022, 4, 23), "Break"),
          HabitDate(DateTime(2022, 4, 24), "Break"),
        ],
        false,
      ),
      Habit(
        2,
        "Study for Exam",
        "Weekly",
        DateTime(2022, 4, 10),
        [0, 1, 2, 3, 4],
        [
          HabitDate(DateTime(2022, 4, 11), "Completed"),
          HabitDate(DateTime(2022, 4, 12), "Completed"),
          HabitDate(DateTime(2022, 4, 13), "Completed"),
          HabitDate(DateTime(2022, 4, 14), "Uncompleted"),
          HabitDate(DateTime(2022, 4, 15), "Break"),
          HabitDate(DateTime(2022, 4, 16), "Break"),
          HabitDate(DateTime(2022, 4, 17), "Uncompleted"),
          HabitDate(DateTime(2022, 4, 18), "Completed"),
          HabitDate(DateTime(2022, 4, 19), "Completed"),
          HabitDate(DateTime(2022, 4, 20), "Completed"),
          HabitDate(DateTime(2022, 4, 21), "Completed"),
          HabitDate(DateTime(2022, 4, 22), "Uncompleted"),
          HabitDate(DateTime(2022, 4, 23), "Break"),
          HabitDate(DateTime(2022, 4, 24), "Break"),
          HabitDate(DateTime(2022, 4, 19), "Completed"),
          HabitDate(DateTime(2022, 4, 20), "Completed"),
          HabitDate(DateTime(2022, 4, 21), "Completed"),
          HabitDate(DateTime(2022, 4, 22), "Uncompleted"),
          HabitDate(DateTime(2022, 4, 23), "Break"),
          HabitDate(DateTime(2022, 4, 24), "Break"),
        ],
        false,
      ),
    ];
  }
}
