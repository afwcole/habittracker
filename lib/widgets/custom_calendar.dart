import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/widgets/habit_card_button.dart';
import 'package:provider/provider.dart';

class CustomCalendar extends StatefulWidget {
  final HabitModel habit;
  const CustomCalendar({Key? key, required this.habit}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final _controller = PageController(initialPage: 1);
  int _selectedMonth = DateTime.now().month - 1;
  int _selectedYear = DateTime.utc(DateTime.now().year).year;
  DateTime dateInView = DateTime(2022, 5);
  CarouselController carouselController = CarouselController();
  bool showYearPicker = false;
  DateTime selectedDateToEdit = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    List<DateTime> datesToDisplay = allDatesToDisplay(dateInView);

    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showYearPicker = !showYearPicker;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Color(0xFFDDD0FC),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x337856CE),
                          blurRadius: 24,
                          offset: Offset(0, 8),
                        ),
                      ]),
                  child: Text(
                    "${dateInView.year}",
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
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        //const SizedBox(height: 90),
        showYearPicker
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 3,
                      childAspectRatio: (55 / 35),
                      padding: EdgeInsets.zero,
                      children: List.generate(
                        50,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedYear = DateTime(2015 + index).year;
                              dateInView =
                                  DateTime(_selectedYear, _selectedMonth + 1);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 13),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color:
                                  DateTime(2015 + index).year == _selectedYear
                                      ? const Color(0xFF7856CE)
                                      : Colors.transparent,
                            ),
                            child: Center(
                              child: Text(
                                "${DateTime(2015 + index).year}",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    color: DateTime(2015 + index).year ==
                                            _selectedYear
                                        ? Colors.white
                                        : const Color(0xFF7856CE),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMonth = itemIndex;
                          carouselController.animateToPage(itemIndex);
                        });
                      },
                      child: Text(
                        months[itemIndex],
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: itemIndex == _selectedMonth
                                ? const Color(0xFF7856CE)
                                : const Color(0xFFDDD0FC),
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
                    options: CarouselOptions(
                        initialPage: _selectedMonth,
                        height: 40.0,
                        //aspectRatio: 16 / 9,
                        viewportFraction: 0.4,
                        enableInfiniteScroll: false,
                        onPageChanged: (pageViewIndex, changedReason) {
                          setState(() {
                            _selectedMonth = pageViewIndex;
                            dateInView =
                                DateTime(_selectedYear, pageViewIndex + 1);
                          });
                        }),
                    carouselController: carouselController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      7,
                      (index) => Row(
                        children: [
                          Text(
                            weekDays1[index],
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7856CE),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 7,
                      padding: EdgeInsets.zero,
                      children: List.generate(
                          datesToDisplay.length,
                          (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (datesToDisplay[index].month ==
                                      dateInView.month) {
                                    selectedDateToEdit = datesToDisplay[index];
                                  }
                                });
                              },
                              child: Wrap(
                                children: [
                                  calendarDateWidget(index, datesToDisplay),
                                ],
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, //.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Provider.of<UserDataProvider>(context,
                                      listen: false)
                                  .updateHabitHistory(widget.habit,
                                      selectedDateToEdit, "Completed");
                            });
                          },
                          child: Container(
                            width: 110,
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                "Completed",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xFFB3D264),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x337856CE),
                                    blurRadius: 24,
                                    offset: Offset(0, 8),
                                  ),
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Provider.of<UserDataProvider>(context,
                                      listen: false)
                                  .updateHabitHistory(widget.habit,
                                      selectedDateToEdit, "Break");
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15), //.all(10),
                            child: Center(
                              child: Text(
                                "Break",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF7856CE),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: const Color(0xFF7856CE), width: 2),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x337856CE),
                                    blurRadius: 24,
                                    offset: Offset(0, 8),
                                  ),
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Provider.of<UserDataProvider>(context,
                                      listen: false)
                                  .updateHabitHistory(widget.habit,
                                      selectedDateToEdit, "Uncompleted");
                            });
                          },
                          child: Container(
                            width: 110,
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                "Uncompleted",
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: const Color(0xFF7856CE),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x337856CE),
                                    blurRadius: 24,
                                    offset: Offset(0, 8),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
      ],
    );
  }

  Widget calendarDateWidget(int index, List<DateTime> datesToDisplay) {
    //final daysInMonth = DateTime(dateInView.year, dateInView.month + 1, 0).day;
    DateTime date = datesToDisplay[index];
    final String _habitActivity = widget.habit.habitHistory[date] ?? " ";

    return Column(
      children: [
        Icon(
          selectedDateToEdit == datesToDisplay[index] &&
                  date.month == dateInView.month
              ? Icons.circle
              : null,
          color: const Color(0xFF7856CE),
          size: 7,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 25,
          child: Center(
            child: Text(
              "${date.day}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: _habitActivity.compareTo("Break") == 0 ||
                          _habitActivity.compareTo(" ") == 0
                      ? const Color(0xFF7856CE)
                          .withOpacity(date.month == dateInView.month ? 1 : 0.5)
                      : Colors.white.withOpacity(
                          date.month == dateInView.month ? 1 : 0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getDateIconColor(_habitActivity)
                .withOpacity(date.month == dateInView.month ? 1 : 0.5),
            border: _habitActivity == "Break"
                ? Border.all(
                    color: const Color(0xFF7856CE)
                        .withOpacity(date.month == dateInView.month ? 1 : 0.5),
                    width: 2,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  List<DateTime> allDatesToDisplay(DateTime dateMonth) {
    return prevMonthDates(dateMonth) +
        currentMonthDates(dateMonth) +
        nextMonthDates(dateMonth);
  }

  List<DateTime> prevMonthDates(DateTime dateMonth) {
    List<DateTime> prevMonthDates = [];
    int noDaysPrev = DateTime(dateMonth.year, dateMonth.month, 1).weekday - 1;
    for (int i = 1; i <= noDaysPrev; i++) {
      prevMonthDates.add(DateTime.utc(dateMonth.year, dateMonth.month, 1 - i));
    }
    return prevMonthDates.reversed.toList();
  }

  List<DateTime> currentMonthDates(DateTime dateMonth) {
    List<DateTime> currentMonthDates = [];
    int noDaysInMonth = DateTime(dateMonth.year, dateMonth.month + 1, 0).day;
    for (int i = 1; i <= noDaysInMonth; i++) {
      currentMonthDates.add(DateTime.utc(dateMonth.year, dateMonth.month, i));
    }
    return currentMonthDates;
  }

  List<DateTime> nextMonthDates(DateTime dateMonth) {
    List<DateTime> nextMonthDates = [];
    int noDaysNext =
        7 - DateTime(dateMonth.year, dateMonth.month + 1, 0).weekday;
    for (int i = 1; i <= noDaysNext; i++) {
      nextMonthDates.add(DateTime.utc(dateMonth.year, dateMonth.month + 1, i));
    }
    return nextMonthDates;
  }
}
