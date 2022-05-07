import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/widgets/frequency_option_widget.dart';
import 'package:habittracker/widgets/simple_toggle.dart';
import 'package:provider/provider.dart';

class BuildBottomSheet extends StatefulWidget {
  const BuildBottomSheet({Key? key}) : super(key: key);

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  final List<String> selectedOptions = [];
  final List<int> selectedDays = [];
  bool notificationSwitch = false;
  String habitName = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          habitName = value;
                        });
                      },
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
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.red,
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
                    FrequencyOptionsSection(
                        selectedDays: selectedDays,
                        selectedOptions: selectedOptions),
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
                    SimpleToggle(
                      label: "Switch on habit notifications",
                      isSwitched: notificationSwitch,
                      onChanged: (value) {
                        setState(() {
                          notificationSwitch = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: const Color(0xFFF9F7FF),
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate() &&
                      selectedOptions.isNotEmpty) {
                    Provider.of<UserDataProvider>(context, listen: false)
                        .addHabitToList(habitName, selectedOptions.first,
                            selectedDays, notificationSwitch);
                    Navigator.pop(context);
                  }
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
    );
  }
}
