import 'package:flutter/material.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/widgets/horizontal_date_widget.dart';
import 'package:provider/provider.dart';

class HorizontalCalendar extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final double height;
  final List<DateTime>? initialSelectedDates;
  final EdgeInsetsGeometry? padding;
  final int? minSelectedDateCount;
  final int? maxSelectedDateCount;

  const HorizontalCalendar({
    Key? key,
    required this.firstDate,
    required this.lastDate,
    this.height = 100,
    this.padding,
    this.minSelectedDateCount,
    this.maxSelectedDateCount,
    this.initialSelectedDates,
  }) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final List<DateTime> selectedDates = [];

  @override
  void initState() {
    super.initState();
    selectedDates.addAll(widget.initialSelectedDates!.map((toDMY)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...getWeekDateList().map(
          (date) => HorizontalDateWidget(
            date: date,
            isSelected: Provider.of<AppDataProvider>(context, listen: false)
                .isSelectedDate(date),
            isDisabled: Provider.of<AppDataProvider>(context, listen: false)
                    .today
                    .compareTo(date) <
                0,
            onTap: () {
              if (!selectedDates.contains(date)) {
                if (widget.maxSelectedDateCount == 1 &&
                    selectedDates.length == 1) {
                  selectedDates.clear();
                } else if (widget.maxSelectedDateCount ==
                    selectedDates.length) {
                  return;
                }
                Provider.of<AppDataProvider>(context, listen: false)
                    .setSelectedDate(date);
              }
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
