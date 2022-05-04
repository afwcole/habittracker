import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/widgets/range_picker_widget.dart';
import 'package:habittracker/widgets/streaks_card.dart';
import 'package:habittracker/widgets/percent_card.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AnalyticsPage extends StatefulWidget {
  final HabitModel habit;
  const AnalyticsPage({Key? key, required this.habit}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  final List<String> _rangeOptions = [
    "Past 7 Days",
    "Past 30 Days",
    "Past Year"
  ];
  String _selectedRange = "Past 7 Days";
  int _selectedRangeInt = 7;
  int calculatedDays = 0;
  int completedDays = 0;

  double getCompletedRate() {
    if (_selectedRange == "Past 7 Days") {
      _selectedRangeInt = 7;
    } else if (_selectedRange == "Past 30 Days") {
      _selectedRangeInt = 30;
    } else {
      _selectedRangeInt = 365;
    }

    calculatedDays =
        widget.habit.getStatsInRange(_selectedRangeInt)["range_calculated"]!;
    completedDays =
        widget.habit.getStatsInRange(_selectedRangeInt)["completed"]!;

    return completedDays / calculatedDays;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 36),
          Text(
            widget.habit.habitName,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Color(0xFF7856CE),
                fontWeight: FontWeight.w800,
              ),
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Color(0x337856CE),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ..._rangeOptions.map((option) => RangePickerWidget(
                    statOption: option,
                    isSelected: _selectedRange == option,
                    onTap: () {
                      setState(() {
                        _selectedRange = option;
                      });
                    },
                  )),
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            "30 Day Stats",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF7856CE),
                fontWeight: FontWeight.w600,
              ),
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Color(0x337856CE),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          StaggeredGrid.count(
            crossAxisCount: 9,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 8,
                child: percentCard(
                    "Avg Completion \nRate",
                    Icons.check_circle_rounded,
                    getCompletedRate(),
                    "$completedDays/$calculatedDays Days"),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 4,
                child: streaksCard("Current \nStreak",
                    widget.habit.getCurrentStreak(), "Days", Icons.link),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 4,
                child: streaksCard("Best \nStreak",
                    widget.habit.getBestStreak(), "Days", Icons.link),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            "Habit History",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xFF7856CE),
                fontWeight: FontWeight.w600,
              ),
              shadows: <Shadow>[
                const Shadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Color(0x337856CE),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 300,
            width: 400,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x337856CE),
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ]),
            child: SfCalendar(
              view: CalendarView.month,
              firstDayOfWeek: 1,
              cellBorderColor: Colors.transparent,
              todayHighlightColor: const Color(0xFF7856CE),
            ),
          ),
          const SizedBox(
            height: 110,
          )
        ],
      ),
    );
  }
}
