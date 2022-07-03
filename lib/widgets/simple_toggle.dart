import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/theme/theme_constants.dart';

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
              color: COLOR_PRIMARY,
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
          activeTrackColor: COLOR_SECONDARY,
          activeColor: COLOR_PRIMARY,
        ),
      ],
    );
  }
}
