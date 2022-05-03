import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget analyticsBody(BuildContext context) {
  List<String> statOptions = ["Past 7 Days", "Past 30 Days", "Past Year"];
  return SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 36),
        Text(
          "Morning Workout",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 24,
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
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...statOptions.map(
              (option) => Container(
                width: 105,
                decoration:
                    false ? _selectedDecoration() : _defaultDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    option,
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
            ),
          ],
        ),
        const SizedBox(
          height: 45,
        ),
        Text(
          "30 Day Stats",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
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
        const SizedBox(height: 15),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: 228,
                    width: 192,
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
                    child: Column(children: [
                      Text(
                        "Avg. Completion \nRate",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "80%",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Days",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
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
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 70,
                    width: 192,
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
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 149,
                    width: 123,
                    padding: const EdgeInsets.all(15),
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
                    child: Column(children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.link,
                            color: Color(0xFF7856CE),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Current \nStreak",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
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
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "42",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Days",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
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
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 149,
                    width: 123,
                    padding: const EdgeInsets.all(15),
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
                    child: Column(children: [
                      Text(
                        "Best \nStreak",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "112",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 24,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Days",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
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
                    ]),
                  ),
                ],
              ),
            ]),
        const SizedBox(height: 50),
        Text(
          "Habit History",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
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
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 300,
          width: 400,
          padding: const EdgeInsets.all(20),
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
        ),
        const SizedBox(
          height: 110,
        )
      ],
    ),
  );
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
