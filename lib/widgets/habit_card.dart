import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/pages/analytics_page.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/widgets/habit_card_button.dart';
import 'package:provider/provider.dart';

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
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
                    fontSize: 14,
                    color: Color(0xFF7856CE),
                    fontWeight: FontWeight.w300,
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
                    child: IconButton(
                      icon: const Icon(
                        Icons.equalizer,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AnalyticsPage(habit: widget.habit)),
                        );
                      },
                      color: Colors.white,
                      iconSize: 19,
                    ),
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

Widget weeklyStreak(BuildContext context, Map habitHistory) {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...getWeekDateList()
            .map((date) => cardDateIcon(context, date, habitHistory[date])),
      ],
    ),
  );
}

Widget cardDateIcon(BuildContext context, DateTime date, String? activity) {
  Color iconColor = getDateIconColor(activity);

  return Consumer<AppDataProvider>(
    builder: (context, userDataProvider, child) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          userDataProvider.isSelectedDate(date) ? Icons.circle : null,
          color: const Color(0xFF7856CE),
          size: 7,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          weekdayToISOString(date.weekday, 1),
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
            date.day.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14,
                color: activity == "Break" || activity == null
                    ? const Color(0xFF7856CE)
                    : Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: activity == "Break"
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
    ),
  );
}
