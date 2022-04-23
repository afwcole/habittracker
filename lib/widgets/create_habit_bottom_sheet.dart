import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/widgets/frequency_option_widget.dart';

Future createHabitBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints:
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
    context: context,
    backgroundColor: const Color(0xFFF9F7FF),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    builder: (context) => SizedBox(
      height: 600,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Create new habit",
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
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Name of Habit",
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
                  const SizedBox(height: 10),
                  TextFormField(
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    cursorColor: const Color(0xFF7856CE),
                    decoration: InputDecoration(
                      hintText: 'Enter the name of the habit',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.grey,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.deepPurple,
                          )),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Choose frequency",
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
                  const SizedBox(height: 10),
                  const FrequencyOptionsSection(),
                  const SizedBox(height: 30),
                  Text(
                    "Notifications",
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
                  const SimpleToggle(),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color(0xFFF9F7FF),
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {},
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
                      "Create Habit",
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
            ),
          ),
        ],
      ),
    ),
  );
}

class SimpleToggle extends StatefulWidget {
  const SimpleToggle({Key? key}) : super(key: key);

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
          "Switch on notifications for this habit?",
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
