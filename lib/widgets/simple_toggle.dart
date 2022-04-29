import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleToggle extends StatelessWidget {
  final bool isSwitched;
  final String label;
  final Function(bool)? onChanged;

  const SimpleToggle(
      {Key? key, required this.label, required this.isSwitched, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7856CE),
              fontWeight: FontWeight.w400,
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
        Switch(
          value: isSwitched,
          onChanged: onChanged,
          activeTrackColor: const Color(0xFFDDD0FC),
          activeColor: const Color(0xFF7856CE),
        ),
      ],
    );
  }
}
