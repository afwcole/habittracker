import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/providers/app_data_provider.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/theme/theme_constants.dart';
import 'package:provider/provider.dart';

class HabitCardButton extends StatefulWidget {
  final HabitModel habit;
  final bool isCompletionButton;

  const HabitCardButton(
      {Key? key, required this.habit, required this.isCompletionButton})
      : super(key: key);

  @override
  State<HabitCardButton> createState() => _HabitCardButtonState();
}

class _HabitCardButtonState extends State<HabitCardButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppDataProvider>(
      builder: (context, userDataProvider, child) => GestureDetector(
        onTap: () {
          Provider.of<UserDataProvider>(context, listen: false)
              .updateHabitHistory(widget.habit, userDataProvider.selectedDate,
                  widget.isCompletionButton ? "Completed" : "Uncompleted");
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color:
                  widget.isCompletionButton ? COLOR_POSITIVE : COLOR_NEGATIVE,
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x337856CE),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.isCompletionButton ? Icons.done : Icons.close,
                color: Colors.white,
                size: 19,
              ),
              Text(
                widget.isCompletionButton ? "Completed" : "Uncompleted",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: widget.isCompletionButton
                        ? Colors.white
                        : Colors.white, // Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
