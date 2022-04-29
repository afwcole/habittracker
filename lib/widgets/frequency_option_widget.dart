import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrequencyOptionsSection extends StatefulWidget {
  final List<String> selectedOptions;
  final List<int> selectedDays;

  const FrequencyOptionsSection(
      {Key? key, required this.selectedOptions, required this.selectedDays})
      : super(key: key);

  @override
  State<FrequencyOptionsSection> createState() =>
      _FrequencyOptionsSectionState();
}

class _FrequencyOptionsSectionState extends State<FrequencyOptionsSection> {
  final List<String> allOptions = ["Daily", "Weekly", "Monthly"];
  final List<String> allDays = ["M", "T", "W", "T", "F", "S", "S"];
  final int maxSelectedOptions = 1;
  final int _maxSelectedOptions = 7;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < allOptions.length; i++)
              _frequencyOption(
                context,
                allOptions[i],
                widget.selectedOptions.contains(allOptions[i]),
                false,
                allOptions[i].length == 1,
                false,
                () {
                  if (!widget.selectedOptions.contains(allOptions[i])) {
                    if (maxSelectedOptions == 1 &&
                        widget.selectedOptions.length == 1) {
                      widget.selectedOptions.clear();
                    } else if (maxSelectedOptions ==
                        widget.selectedOptions.length) {
                      return;
                    }

                    widget.selectedOptions.add(allOptions[i]);
                  }
                  setState(() {});
                },
              ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "On these days",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7856CE),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int j = 0; j < allDays.length; j++)
              _frequencyOption(
                context,
                allDays[j],
                widget.selectedDays.contains(j),
                false,
                true,
                false,
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
        _frequencyOption(context, "Everyday", widget.selectedDays.length >= 7,
            false, false, true, () {
          if (widget.selectedDays.length == 7) {
            widget.selectedDays.clear();
          } else {
            widget.selectedDays.clear();
            widget.selectedDays.addAll([0, 1, 2, 3, 4, 5, 6]);
          }
          setState(() {});
        })
      ],
    );
  }
}

Widget _frequencyOption(
  BuildContext context,
  String optionName,
  bool isSelected,
  bool isDisabled,
  bool isDayOption,
  bool isFullWidth,
  VoidCallback onTap,
) {
  return GestureDetector(
    onTap: isDisabled ? null : onTap,
    child: Container(
      decoration: isSelected ? _selectedDecoration() : _defaultDecoration(),
      height: 38,
      width: isDayOption
          ? 38
          : isFullWidth
              ? null
              : 95,
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
