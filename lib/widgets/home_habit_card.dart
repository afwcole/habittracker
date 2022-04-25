import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit.dart';
import 'package:habittracker/models/habit_date.dart';

class HomeHabitCard extends StatefulWidget {
  final Habit habit;
  const HomeHabitCard({Key? key, required this.habit}) : super(key: key);

  @override
  State<HomeHabitCard> createState() => _HomeHabitCardState();
}

class _HomeHabitCardState extends State<HomeHabitCard> {
  @override
  Widget build(BuildContext context) {
    final List<HabitDate> habitHistory = widget.habit.habitHistory;
    final int noOfDaysInHistory = habitHistory.length;

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
            habitCardButtonRow(context),
          ],
        ),
      ),
    );
  }
}

Widget habitCardButtonRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        habitCardButtons(context, true),
        habitCardButtons(context, false),
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
  );
}

Widget weeklyStreak(BuildContext context, List<HabitDate> habitHistory) {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...habitHistory
            .getRange(habitHistory.length - 8, habitHistory.length - 1)
            .map((habitDate) => cardDateIcon(context, habitDate)),
      ],
    ),
  );
}

Widget habitCardButtons(
  BuildContext context,
  bool isCompletedButton,
) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isCompletedButton
            ? const Icon(
                Icons.done,
                color: Colors.white,
                size: 19,
              )
            : const Icon(
                Icons.close,
                color: Colors.white,
                size: 19,
              ),
        Text(
          isCompletedButton ? "Completed" : "Uncompleted",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
        color: isCompletedButton
            ? const Color(0xFFB3D264)
            : const Color(0xFF7856CE),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x337856CE),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ]),
  );
}

Widget cardDateIcon(BuildContext context, HabitDate habitDate) {
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
