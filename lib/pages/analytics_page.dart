import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/widgets/range_picker_widget.dart';
import 'package:habittracker/widgets/streaks_card.dart';
import 'package:habittracker/widgets/percent_card.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  List<String> rangeOptions = ["Past 7 Days", "Past 30 Days", "Past Year"];
  String selectedRange = "";

  @override
  Widget build(BuildContext context) {
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
              ...rangeOptions.map((option) => RangePickerWidget(
                    statOption: option,
                    isSelected: selectedRange == option,
                    onTap: () {
                      setState(() {
                        selectedRange = option;
                      });
                    },
                  )),
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
              cellBorderColor: Colors.transparent,
              todayHighlightColor: Color(0xFF7856CE),
            ),
          ),
          const SizedBox(
            height: 110,
          )
        ],
      ),
    );
  }
}
