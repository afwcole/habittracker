import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/widgets/streaks_card.dart';
import 'package:habittracker/widgets/percent_card.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

Widget analyticsBody(BuildContext context) {
  List<String> statOptions = ["Past 7 Days", "Past 30 Days", "Past Year"];
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 36),
        Text(
          "Morning Workout",
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
            ...statOptions.map(
              (option) => Container(
                width: 105,
                decoration:
                    false ? _selectedDecoration() : _defaultDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    option,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 12,
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
                ),
              ),
            ),
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
                  "Avg Completion \nRate", Icons.check_circle_rounded, 0.8),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: streaksCard("Current \nStreak", 42, "Days", Icons.link),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 4,
              child: streaksCard("Best \nStreak", 112, "Days", Icons.link),
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
          ),
        ),
        const SizedBox(
          height: 110,
        )
      ],
    ),
  );
}

Decoration _selectedDecoration() {
  return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color(0xFF7856CE), width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x337856CE),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ]);
}

Decoration _defaultDecoration() {
  return const BoxDecoration(
      color: Color(0xFFDDD0FC),
      borderRadius: BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Color(0x337856CE),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ]);
}
