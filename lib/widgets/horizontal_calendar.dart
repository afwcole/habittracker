import 'package:flutter/material.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/widgets/horizontal_date_widget.dart';

class HorizontalCalendar extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final double height;
  final List<DateTime>? initialSelectedDates;
  final double? spacingBetweenDates;
  final EdgeInsetsGeometry? padding;
  final int? minSelectedDateCount;
  final int? maxSelectedDateCount;

  const HorizontalCalendar({
    Key? key,
    required this.firstDate,
    required this.lastDate,
    this.height = 100,
    this.spacingBetweenDates,
    this.padding,
    this.minSelectedDateCount,
    this.maxSelectedDateCount,
    this.initialSelectedDates,
  }) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final List<DateTime> allDates = [];
  final List<DateTime> selectedDates = [];

  @override
  void initState() {
    super.initState();
    allDates.addAll(getDateList(widget.firstDate, widget.lastDate));
    selectedDates.addAll(widget.initialSelectedDates!.map((toDMY)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < allDates.length; i++)
          HorizontalDateWidget(
            date: allDates[i],
            isSelected: selectedDates.contains(allDates[i]),
            onTap: () {
              if (!selectedDates.contains(allDates[i])) {
                if (widget.maxSelectedDateCount == 1 &&
                    selectedDates.length == 1) {
                  selectedDates.clear();
                } else if (widget.maxSelectedDateCount ==
                    selectedDates.length) {
                  return;
                }
                selectedDates.add(allDates[i]);
              }
              setState(() {});
            },
          ),
      ],
    );
  }
}
