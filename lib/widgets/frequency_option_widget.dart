import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakDaysSection extends StatefulWidget {
  final List<String> selectedOptions;
  final List<int> selectedDays;

  const BreakDaysSection(
      {Key? key, required this.selectedOptions, required this.selectedDays})
      : super(key: key);

  @override
  State<BreakDaysSection> createState() => _BreakDaysSectionState();
}

class _BreakDaysSectionState extends State<BreakDaysSection> {
  final List<String> allOptions = ["Daily", "Weekly", "Monthly"];
  final List<String> allDays = ["M", "T", "W", "T", "F", "S", "S"];
  final int maxSelectedOptions = 1;
  final int _maxSelectedOptions = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int j = 0; j < allDays.length; j++)
              __breakDayOption(
                context,
                allDays[j],
                widget.selectedDays.contains(j),
                () {
                  if (!widget.selectedDays.contains(j)) {
                    if (_maxSelectedOptions == 1 &&
                        widget.selectedDays.length == 1) {
                      widget.selectedDays.clear();
                    } else if (_maxSelectedOptions ==
                        widget.selectedDays.length) {
                      return;
                    }
                    widget.selectedDays.add(j);
                  } else {
                    widget.selectedDays.remove(j);
                  }
                  setState(() {});
                },
              ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}

Widget __breakDayOption(
  BuildContext context,
  String optionName,
  bool isSelected,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: isSelected ? _selectedDecoration() : _defaultDecoration(),
      height: 38,
      width: 38,
      child: Center(
        child: Text(
          optionName,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7856CE),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
  );
}

Decoration _selectedDecoration() {
  return BoxDecoration(
    color: const Color(0xFFDDD0FC),
    border: Border.all(color: const Color(0xFF7856CE), width: 2),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}

Decoration _defaultDecoration() {
  return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Color(0x337856CE),
          blurRadius: 24,
          offset: Offset(0, 8),
        ),
      ]);
}
