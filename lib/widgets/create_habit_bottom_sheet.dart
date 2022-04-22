import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/widgets/frequency_option_widget.dart';

Future createHabitBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    constraints:
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
    context: context,
    backgroundColor: const Color(0xFFF9F7FF),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    builder: (context) => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
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
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        ),
      ],
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
