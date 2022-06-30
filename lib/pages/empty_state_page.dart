import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/widgets/build_bottom_sheet.dart';

class EmptyStateBody extends StatelessWidget {
  EmptyStateBody({Key? key}) : super(key: key);

  final List<String> emptyStatePNG = [
    'basketball',
    'calendar',
    'data',
    'jogging_dark',
    'jogging',
    'self_love',
    'vacation'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Habits",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 32,
                    color: Color(0xFF7856CE),
                    fontWeight: FontWeight.w800,
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
            Image.asset(
                'assets/images/${emptyStatePNG[Random().nextInt(emptyStatePNG.length)]}.png'),
            Column(
              children: [
                Text(
                  "No habits yet!",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF7856CE),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Get started  by creating \na new habit.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF808080),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Icon(
                  Icons.arrow_downward_rounded,
                  color: Color(0xFF7856CE),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8),
                  context: context,
                  backgroundColor: const Color(0xFFF9F7FF),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                  builder: (context) => const BuildBottomSheet(),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF7856CE),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x557856CE),
                        blurRadius: 24,
                        offset: Offset(0, 8),
                      ),
                    ]),
                height: 50,
                child: Center(
                  child: Text(
                    "Create a New Habit",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
