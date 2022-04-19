import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';

class HorizontalDateWidget extends StatelessWidget {
  final DateTime date;
  final String? monthFormat;
  final String? dateFormat;
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final bool isSelected;
  final bool isDisabled;

  const HorizontalDateWidget({
    Key? key,
    required this.date,
    this.onTap,
    this.onLongTap,
    this.isSelected = false,
    this.isDisabled = false,
    this.monthFormat,
    this.dateFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      onLongPress: isDisabled ? null : onLongTap,
      child: Container(
        width: 40,
        decoration: isSelected ? selectedDecoration() : defaultDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weekdayToISOString(date.weekday),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7856CE),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date.day.toString(),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7856CE),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Decoration selectedDecoration() {
  return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color(0xFF7856CE), width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x337856CE),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ]);
}

Decoration defaultDecoration() {
  return const BoxDecoration(
      color: Color(0xFFDDD0FC),
      borderRadius: BorderRadius.all(Radius.circular(25)),
      boxShadow: [
        BoxShadow(
          color: Color(0x337856CE),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ]);
}
