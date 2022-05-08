import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakDaysSection extends StatefulWidget {
  final List<int> selectedBreakDays;

  const BreakDaysSection({Key? key, required this.selectedBreakDays})
      : super(key: key);

  @override
  State<BreakDaysSection> createState() => _BreakDaysSectionState();
}

class _BreakDaysSectionState extends State<BreakDaysSection> {
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
            for (int weekdayInt = 0; weekdayInt < allDays.length; weekdayInt++)
              __breakDayOption(
                context,
                allDays[weekdayInt],
                widget.selectedBreakDays.contains(weekdayInt),
                () {
                  if (!widget.selectedBreakDays.contains(weekdayInt)) {
                    if (_maxSelectedOptions == 1 &&
                        widget.selectedBreakDays.length == 1) {
                      widget.selectedBreakDays.clear();
                    } else if (_maxSelectedOptions ==
                        widget.selectedBreakDays.length) {
                      return;
                    }
                    widget.selectedBreakDays.add(weekdayInt);
                  } else {
                    widget.selectedBreakDays.remove(weekdayInt);
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
