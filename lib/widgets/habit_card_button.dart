import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/models/habit_model.dart';
import 'package:habittracker/models/habit_date_model.dart';

class HabitCardButton extends StatefulWidget {
  final HabitModel habit;
  bool isCompletionButton;

  HabitCardButton(
      {Key? key, required this.habit, required this.isCompletionButton})
      : super(key: key);

  @override
  State<HabitCardButton> createState() => _HabitCardButtonState();
}

class _HabitCardButtonState extends State<HabitCardButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.habit.habitHistory.add(HabitDateModel(DateTime.now(),
            widget.isCompletionButton ? "Completed" : "Uncompleted"));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.isCompletionButton
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 19,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 19,
                  ),
            Text(
              widget.isCompletionButton ? "Completed" : "Uncompleted",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: widget.isCompletionButton
                ? const Color(0xFFB3D264)
                : const Color(0xFF7856CE),
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
      ),
    );
  }
}
