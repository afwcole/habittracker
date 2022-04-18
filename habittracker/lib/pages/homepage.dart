import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Row(
              children: [
                dateContainer(context, false),
                const SizedBox(
                  width: 8,
                ),
                dateContainer(context, false),
                const SizedBox(
                  width: 8,
                ),
                dateContainer(context, false),
                const SizedBox(
                  width: 8,
                ),
                dateContainer(context, true),
                const SizedBox(
                  width: 8,
                ),
                dateContainer(context, false),
                const SizedBox(
                  width: 8,
                ),
                dateContainer(context, false),
                const SizedBox(
                  width: 8,
                ),
                dateContainer(context, false),
                const SizedBox(
                  width: 8,
                ),
              ],
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
            const SizedBox(height: 25),
            homeHabitCard(context, false),
            const SizedBox(height: 25),
            homeHabitCard(context, true),
            const SizedBox(height: 25),
            homeHabitCard(context, false),
            const SizedBox(height: 25),
            homeHabitCard(context, false),
            const SizedBox(height: 25),
          ],
        )),
  );
}

Widget dateContainer(BuildContext context, bool selected) {
  return Container(
    width: 40,
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 13),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Fri",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xFF7856CE),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "9",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Color(0xFF7856CE),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
    decoration: BoxDecoration(
        color: selected ? Colors.white : const Color(0xFFDDD0FC),
        border: selected
            ? Border.all(
                color: const Color(0xFF7856CE),
                width: 2,
              )
            : null,
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

Widget homeHabitCard(BuildContext context, bool dropdownActive) {
  return Container(
    padding: const EdgeInsets.all(22),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Eat Breakfast",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7856CE),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "Daily",
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
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF7856CE)),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            cardDateIcon(context, "M", const Color(0xFFB3D264), false),
            const SizedBox(
              width: 18,
            ),
            cardDateIcon(context, "T", const Color(0xFFE85F4D), false),
            const SizedBox(
              width: 18,
            ),
            cardDateIcon(context, "W", const Color(0xFFB3D264), true),
            const SizedBox(
              width: 18,
            ),
            cardDateIcon(context, "T", const Color(0xFFB3D264), false),
            const SizedBox(
              width: 18,
            ),
            cardDateIcon(context, "F", const Color(0xFFB3D264), false),
            const SizedBox(
              width: 18,
            ),
            cardDateIcon(context, "S", const Color(0xFFB3D264), false),
            const SizedBox(
              width: 18,
            ),
            cardDateIcon(context, "S", const Color(0xFFB3D264), false),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            habitCardButtons(context, true),
            const SizedBox(
              width: 15,
            ),
            habitCardButtons(context, false),
            const SizedBox(
              width: 15,
            ),
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
      ],
    ),
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
