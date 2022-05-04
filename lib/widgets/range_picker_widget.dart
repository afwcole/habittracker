import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RangePickerWidget extends StatelessWidget {
  final String statOption;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool isDisabled;

  const RangePickerWidget({
    Key? key,
    required this.statOption,
    this.onTap,
    this.isSelected = false,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: 105,
        decoration: isSelected ? _selectedDecoration() : _defaultDecoration(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            statOption,
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
    );
  }
}

Decoration _selectedDecoration() {
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

Decoration _defaultDecoration() {
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
