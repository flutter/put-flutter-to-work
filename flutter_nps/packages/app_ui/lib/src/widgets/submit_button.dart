import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('capturePage_submit_elevatedButton'),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.xxhuge,
          vertical: Spacing.s,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
