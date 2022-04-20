import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/widgets/home_habit_card.dart';
import 'package:habittracker/widgets/horizontal_calendar.dart';
import 'package:habittracker/widgets/horizontal_date_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainBody(context),
    );
  }
}

Widget mainBody(BuildContext context) {
  return SafeArea(
    child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 36),
            Text(
              "Habits",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 32,
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
            const SizedBox(height: 36),
            HorizontalCalendar(
              firstDate: DateTime(2022, 4, 13),
              lastDate: DateTime(2022, 4, 19),
              spacingBetweenDates: 8,
              minSelectedDateCount: 1,
              maxSelectedDateCount: 1,
              initialSelectedDates: [DateTime(2022, 4, 19)],
            ),
            const SizedBox(height: 39),
            Text(
              "Streaks",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24,
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
              height: 25,
            ),
            const HomeHabitCard(),
            const SizedBox(height: 25),
            const HomeHabitCard(),
            const SizedBox(height: 25),
            const HomeHabitCard(),
            const SizedBox(height: 25),
            const HomeHabitCard(),
            const SizedBox(height: 25),
          ],
        )),
  );
}

Widget cardDateIcon(
    BuildContext context, String day, Color iconColor, bool isBorderOn) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        day,
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
          "11",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14,
              color: isBorderOn ? const Color(0xFF7856CE) : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: isBorderOn
              ? Border.all(
                  color: const Color(0xFF7856CE),
                  width: 2,
                )
              : null,
          color: isBorderOn ? Colors.white : iconColor,
          shape: BoxShape.circle,
        ),
      ),
    ],
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
