import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/models/habit_model.dart';

class CustomCalendar extends StatefulWidget {
  final HabitModel habit;
  const CustomCalendar({Key? key, required this.habit}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final _controller = PageController(initialPage: 1);
  DateTime dateInView = DateTime(2022, 5);
  int _selectedMonth = DateTime.now().month - 1;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<DateTime> datesToDisplay = allDatesToDisplay(dateInView);

    return Container(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    print("Hello World");
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
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
                              ? Color(0xFF7856CE)
                              : Color(0xFFDDD0FC),
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
                          dateInView = DateTime(2022, pageViewIndex + 1);
                        });
                      }),
                  carouselController: carouselController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 7),
          Expanded(
              child: PageView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: double.infinity,
                child: GridView.count(
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                  padding: EdgeInsets.zero,
                  children: List.generate(datesToDisplay.length,
                      (index) => calendarDateWidget(index, datesToDisplay)),
                ),
              );
            },
            pageSnapping: true,
          )),
        ],
      ),
    );
  }

  Widget calendarDateWidget(int index, List<DateTime> datesToDisplay) {
    //final daysInMonth = DateTime(dateInView.year, dateInView.month + 1, 0).day;
    DateTime date = datesToDisplay[index];
    final String _habitActivity = widget.habit.habitHistory[date] ?? " ";

    return Container(
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
                  : Colors.white
                      .withOpacity(date.month == dateInView.month ? 1 : 0.5),
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
