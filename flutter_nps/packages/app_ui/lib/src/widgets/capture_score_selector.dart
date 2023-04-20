import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CaptureScoreSelector extends StatelessWidget {
  const CaptureScoreSelector({
    Key? key,
    required this.maxScore,
    required this.selectedIndex,
    required this.selectedCallback,
  }) : super(key: key);

  final int maxScore;
  final int selectedIndex;
  final void Function(int index) selectedCallback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          maxScore,
          (index) {
            return ScoreButton(
              index: index,
              isSelected: selectedIndex == index,
              selectedCallback: selectedCallback,
              theme: theme,
            );
          },
        ),
      ),
    );
  }
}

class ScoreButton extends StatelessWidget {
  const ScoreButton({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.selectedCallback,
    required this.theme,
  }) : super(key: key);

  final int index;
  final bool isSelected;
  final void Function(int index) selectedCallback;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 500);
    return AnimatedContainer(
      duration: duration,
      height: Spacing.huge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? NpsColors.colorSecondary : NpsColors.colorGrey5,
      ),
      child: TextButton(
        onPressed: () => selectedCallback(index),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<CircleBorder>(
            const CircleBorder(),
          ),
          alignment: Alignment.center,
        ),
        child: AnimatedDefaultTextStyle(
          style: theme.textTheme.titleMedium?.copyWith(
                color:
                    isSelected ? NpsColors.colorWhite : NpsColors.colorPrimary1,
              ) ??
              const TextStyle(),
          duration: duration,
          child: Text(
            (index + 1).toString(),
          ),
        ),
      ),
    );
  }
}
