import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/models/habit_date_model.dart';
import 'package:habittracker/widgets/habit_card_button.dart';

class HabitCard extends StatefulWidget {
  final HabitModel habit;
  const HabitCard({Key? key, required this.habit}) : super(key: key);

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFFDDD0FC),
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
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          iconPadding: EdgeInsets.fromLTRB(0, 20, 20, 0),
          iconColor: Color(0xFF7856CE),
          inkWellBorderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        header: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.habit.habitName,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7856CE),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                widget.habit.frequencyType,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7856CE),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ],
          ),
        ),
        collapsed: Column(
          children: [
            weeklyStreak(
              context,
              widget.habit.habitHistory,
            ),
          ],
        ),
        expanded: Column(
          children: [
            weeklyStreak(
              context,
              widget.habit.habitHistory,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HabitCardButton(
                      habit: widget.habit, isCompletionButton: true),
                  HabitCardButton(
                      habit: widget.habit, isCompletionButton: false),
                  Container(
                    child: IconButton(
                        icon: const Icon(
                          Icons.equalizer,
                        ),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 19),
                    decoration: const BoxDecoration(
                        color: Color(0xFF7856CE),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x337856CE),
                            blurRadius: 24,
                            offset: Offset(0, 8),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget weeklyStreak(BuildContext context, List<HabitDateModel> habitHistory) {
  DateTime today = DateTime.now();
  DateTime currentWeekStartDate = DateTime.utc(
      today.year, today.month, today.day - (today.weekday - 1)); //Monday

  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...getWeeksHabitDates(currentWeekStartDate, habitHistory)
            .reversed
            .map((habitDate) => cardDateIcon(context, habitDate)),
        for (int j = 0; j <= 7 - today.weekday; j++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weekdayToISOString(
                    DateTime.utc(today.year, today.month, today.day + j)
                        .weekday,
                    1),
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7856CE),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.center,
                height: 26,
                width: 26,
                child: Text(
                  DateTime.utc(today.year, today.month, today.day + j)
                      .day
                      .toString(),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7856CE),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    ),
  );
}

Widget cardDateIcon(BuildContext context, HabitDateModel habitDate) {
  Color iconColor = getDateIconColor(habitDate);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        weekdayToISOString(habitDate.date.weekday, 1),
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFF7856CE),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      Container(
        alignment: Alignment.center,
        height: 26,
        width: 26,
        child: Text(
          habitDate.date.day.toString(),
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              color: habitDate.activity == "Break"
                  ? const Color(0xFF7856CE)
                  : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: habitDate.activity == "Break"
              ? Border.all(
                  color: const Color(0xFF7856CE),
                  width: 2,
                )
              : null,
          color: iconColor,
          shape: BoxShape.circle,
        ),
      ),
    ],
  );
}
