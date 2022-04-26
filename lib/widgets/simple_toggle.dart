import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleToggle extends StatefulWidget {
  final String label;
  const SimpleToggle({Key? key, required this.label}) : super(key: key);

  @override
  State<SimpleToggle> createState() => _SimpleToggleState();
}

class _SimpleToggleState extends State<SimpleToggle> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
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
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
          activeTrackColor: const Color(0xFFDDD0FC),
          activeColor: const Color(0xFF7856CE),
        ),
      ],
    );
  }
}
