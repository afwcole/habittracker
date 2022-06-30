import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/widgets/habit_card.dart';
import 'package:habittracker/widgets/horizontal_calendar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userDataProvider, child) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            bottom: false,
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
                Text(
                  monthToISOString(DateTime.now().month),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7856CE),
                      fontWeight: FontWeight.w400,
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
                  height: 10,
                ),
                const HorizontalCalendar(),
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
                Column(
                  children: [
                    ...userDataProvider.habitList.map((habit) {
                      return Column(children: [
                        HabitCard(habit: habit),
                        const SizedBox(
                          height: 25,
                        )
                      ]);
                    }),
                  ],
                ),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          )),
    );
  }
}
