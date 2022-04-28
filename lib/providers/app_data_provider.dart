import 'package:flutter/cupertino.dart';
import 'package:habittracker/functions/date_helper.dart';

class AppDataProvider extends ChangeNotifier {
  DateTime _selectedDate = toDMY(DateTime.now());
  final DateTime _today = toDMY(DateTime.now());

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  bool isSelectedDate(DateTime date) => selectedDate.compareTo(date) == 0;

  DateTime get today => _today;

  DateTime get thisWeekStartDate => DateTime.utc(
      _today.year, _today.month, _today.day - (_today.weekday - 1));

  DateTime get thisWeekEndDate => DateTime.utc(thisWeekStartDate.year,
      thisWeekStartDate.month, thisWeekStartDate.day + 6);
}
