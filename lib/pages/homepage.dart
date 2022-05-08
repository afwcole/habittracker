import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/widgets/habit_card.dart';
import 'package:habittracker/widgets/horizontal_calendar.dart';
import 'package:habittracker/widgets/build_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: mainBody(context),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: const Color(0xFF7856CE),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
            context: context,
            backgroundColor: const Color(0xFFF9F7FF),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            builder: (context) => const BuildBottomSheet(),
          );
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}

Widget mainBody(BuildContext context) {
  return Consumer<UserDataProvider>(
    builder: (context, userDataProvider, child) => SingleChildScrollView(
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
        )),
  );
}
