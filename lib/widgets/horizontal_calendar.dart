import 'package:flutter/material.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/widgets/horizontal_date_widget.dart';
import 'package:provider/provider.dart';

class HorizontalCalendar extends StatefulWidget {
  final double height;
  final EdgeInsetsGeometry? padding;

  const HorizontalCalendar({
    Key? key,
    this.height = 100,
    this.padding,
  }) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
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
              Provider.of<AppDataProvider>(context, listen: false)
                  .setSelectedDate(date);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
