import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/theme/theme_constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget percentCard(
    String statTitle, IconData icon, double percentValue, String rateLabel) {
  Color indicatorColor;

  if (percentValue.isNaN) {
    percentValue = 0;
  }

  if (percentValue < 0.5) {
    indicatorColor = COLOR_NEGATIVE;
  } else if (percentValue < 0.6) {
    indicatorColor = COLOR_PRIMARY;
  } else {
    indicatorColor = COLOR_POSITIVE;
  }

  return Container(
    width: 123,
    height: 149,
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
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: COLOR_PRIMARY,
            size: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            statTitle,
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
        ],
      ),
      CircularPercentIndicator(
        radius: 70.0,
        lineWidth: 9.0,
        percent: percentValue,
        progressColor: indicatorColor,
        backgroundColor: Colors.transparent,
        curve: Curves.decelerate,
        circularStrokeCap: CircularStrokeCap.round,
        animation: true,
        animationDuration: 1000,
        center: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(percentValue * 100).toStringAsFixed(0)}%",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: indicatorColor,
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
              const SizedBox(
                height: 5,
              ),
              Text(
                rateLabel,
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
            ],
          ),
        ),
      ),
      const SizedBox()
    ]),
  );
}
