import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/theme/theme_constants.dart';
import 'package:habittracker/widgets/build_edit_bottom_sheet.dart';
import 'package:habittracker/widgets/custom_calendar.dart';
import 'package:habittracker/widgets/range_picker_widget.dart';
import 'package:habittracker/widgets/streaks_card.dart';
import 'package:habittracker/widgets/percent_card.dart';
import 'package:provider/provider.dart';

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
  String habitName = "";

  double getCompletedRate() {
    Map statsInRange = widget.habit.getStatsInRange(_selectedRangeInt);
    if (_selectedRange == "Past 7 Days") {
      _selectedRangeInt = 7;
    } else if (_selectedRange == "Past 30 Days") {
      _selectedRangeInt = 30;
    } else {
      _selectedRangeInt = 365;
    }

    calculatedDays = statsInRange["range_calculated"];
    completedDays = (statsInRange["completed"]! + statsInRange["break"]!);
    return (completedDays / calculatedDays);
  }

  @override
  Widget build(BuildContext context) {
    habitName = Provider.of<UserDataProvider>(context, listen: true)
        .habitList
        .firstWhere((element) => element == widget.habit)
        .habitName;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: COLOR_PRIMARY,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
            context: context,
            backgroundColor: const Color(0xFFF9F7FF),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            builder: (context) =>
                BuildEditHabitBottomSheet(habit: widget.habit),
          );
        },
        child: const Icon(
          Icons.edit,
          size: 32,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 36),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: COLOR_PRIMARY,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Expanded(
                    child: AutoSizeText(
                      habitName,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 16,
                      maxLines: 2,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          color: COLOR_PRIMARY,
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
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
                "$_selectedRange Stats",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: COLOR_PRIMARY,
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
                    color: COLOR_PRIMARY,
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
                child: CustomCalendar(
                  habit: widget.habit,
                ),
              ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
