import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class ChipsPanel extends StatelessWidget {
  const ChipsPanel({
    Key? key,
    required this.chips,
    required this.selectedChipIndexes,
    required this.canSubmit,
    required this.chipToggleCallback,
    required this.onSubmit,
    this.buttonText = '',
  }) : super(key: key);

  final List<String> chips;
  final List<int> selectedChipIndexes;
  final bool canSubmit;
  final void Function(int) chipToggleCallback;
  final VoidCallback onSubmit;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AnswerChips(
            chips: chips,
            selectedChipIndices: selectedChipIndexes,
            chipToggleCallback: chipToggleCallback,
          ),
          const SizedBox(height: Spacing.lg),
          SubmitButton(
            buttonText: buttonText,
            onPressed: canSubmit ? onSubmit : null,
          ),
        ],
      ),
    );
  }
}
