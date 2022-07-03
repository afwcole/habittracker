import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/theme/theme_constants.dart';

Widget streaksCard(String statTitle, int value, String units, IconData icon) {
  return Container(
    padding: const EdgeInsets.fromLTRB(18, 15, 18, 15),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x337856CE),
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ]),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        statTitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 12,
            color: COLOR_PRIMARY,
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
      Text(
        value.toString(),
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 20,
            color: COLOR_PRIMARY,
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
      Text(
        units,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xFFA5A5A5),
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
      const SizedBox(height: 10),
    ]),
  );
}
