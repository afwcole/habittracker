import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/models/habit.dart';
import 'package:habittracker/models/habit_date.dart';
import 'package:habittracker/widgets/create_habit_bottom_sheet.dart';
import 'package:habittracker/widgets/home_habit_card.dart';
import 'package:habittracker/widgets/horizontal_calendar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: mainBody(context),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: const Color(0xFF7856CE), //const Color(0xFFB3D264),
        onPressed: () {
          createHabitBottomSheet(context);
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        color:
            const Color(0xFFF9F7FF), //Colors.white, //const Color(0xFF7856CE),
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(
                Icons.home,
                color: const Color(0xFF7856CE),
              ),
              padding: const EdgeInsets.all(15),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.equalizer,
                color: const Color(0xFF7856CE),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget mainBody(BuildContext context) {
  List<Habit> usersHabits = Habit.fetchAll();

  return SingleChildScrollView(
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
            "January",
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
          Column(
            children: [
              ...usersHabits.map((habit) {
                return Column(children: [
                  HomeHabitCard(habit: habit),
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
      ));
}
