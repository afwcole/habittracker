import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habittracker/functions/date_helper.dart';
import 'package:habittracker/providers/user_data_provider.dart';
import 'package:habittracker/theme/theme_constants.dart';
import 'package:habittracker/widgets/select_break_widget.dart';
import 'package:habittracker/widgets/simple_toggle.dart';
import 'package:provider/provider.dart';

class BuildBottomSheet extends StatefulWidget {
  const BuildBottomSheet({Key? key}) : super(key: key);

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  final List<int> selectedBreakDays = [];
  bool notificationSwitch = false;
  String habitName = "";
  final _formKey = GlobalKey<FormState>();

  DateTime startDate = DateTime.now();

  Future<void> _startDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      helpText: "Select start date",
      initialDate: startDate,
      firstDate: DateTime(DateTime.now().year, DateTime.now().month),
      lastDate: DateTime(2101),
      builder: (context, child) => Theme(
          data: ThemeData(
            fontFamily:
                GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
          ).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: COLOR_PRIMARY,
              onPrimary: Colors.white,
              surface: Color(0xFFF9F7FF),
              onSurface: COLOR_PRIMARY,
            ),
            dialogBackgroundColor: const Color(0xFFF9F7FF),
          ),
          child: child!),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

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
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Name of Habit",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
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
                      cursorColor: COLOR_PRIMARY,
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
                      "Select start date",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
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
                    const SizedBox(height: 15),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _startDate(context),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: COLOR_SECONDARY,
                        ),
                        child: Text(
                          displayDateStr(startDate),
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
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Choose break days",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
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
                    const SizedBox(height: 15),
                    BreakDaysSection(selectedBreakDays: selectedBreakDays),
                    const SizedBox(height: 20),
                    Text(
                      "Notifications",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
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
                  if (_formKey.currentState!.validate()) {
                    Provider.of<UserDataProvider>(context, listen: false)
                        .addHabitToList(habitName, startDate, selectedBreakDays,
                            notificationSwitch);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: COLOR_PRIMARY,
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
