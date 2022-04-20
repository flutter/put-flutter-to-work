import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AnswerChips extends StatelessWidget {
  const AnswerChips({
    Key? key,
    required this.chips,
    required this.selectedChipIndices,
    required this.chipToggleCallback,
  }) : super(key: key);

  final List<String> chips;
  final List<int> selectedChipIndices;
  final void Function(int) chipToggleCallback;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: List<List<Widget>>.generate(
        chips.length,
        (index) {
          final isSelected = selectedChipIndices.contains(index);
          return <Widget>[
            ActionChip(
              onPressed: () => chipToggleCallback(index),
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.s,
                vertical: Spacing.s,
              ),
              label: Text(
                chips[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? NpsColors.colorWhite
                      : NpsColors.colorPrimary1,
                ),
              ),
              backgroundColor:
                  isSelected ? NpsColors.colorSecondary : NpsColors.colorGrey5,
            ),
            const SizedBox(width: 8),
          ];
        },
      ).reduce((value, element) => [...value, ...element]),
    );
  }
}
