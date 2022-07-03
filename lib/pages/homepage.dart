import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/theme/theme_constants.dart';
import 'package:habittracker/widgets/habit_card.dart';
import 'package:habittracker/widgets/horizontal_calendar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userDataProvider, child) => SingleChildScrollView(
          child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                  const SizedBox(height: 36),
                  Text(
                    monthToISOString(DateTime.now().month),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: COLOR_PRIMARY,
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
                    height: 25,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ...userDataProvider.habitList.map((habit) {
                  return Column(children: [
                    Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        extentRatio: 0.3,
                        motion: const ScrollMotion(),
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              userDataProvider.removeHabitFromHabitList(habit);
                            },
                            elevation: 1.0,
                            fillColor: Colors.red,
                            padding: const EdgeInsets.all(10.0),
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.delete,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      child: HabitCard(habit: habit),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ]);
                }),
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      )),
    );
  }
}
