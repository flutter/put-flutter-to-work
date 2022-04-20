import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Spacing.xl,
        right: Spacing.s,
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
