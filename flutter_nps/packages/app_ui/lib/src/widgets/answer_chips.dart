import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AnswerChips extends StatelessWidget {
  const AnswerChips({
    Key? key,
    required this.chips,
    required this.selectedChipsIndexes,
    required this.chipToogleCallback,
  }) : super(key: key);

  final List<String> chips;
  final List<int> selectedChipsIndexes;
  final Function(int) chipToogleCallback;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: List<List<Widget>>.generate(
        chips.length,
        (index) {
          final isSelected = selectedChipsIndexes.contains(index);
          return <Widget>[
            ActionChip(
              onPressed: () => chipToogleCallback(index),
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spacing15,
                vertical: Spacing.spacing15,
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
