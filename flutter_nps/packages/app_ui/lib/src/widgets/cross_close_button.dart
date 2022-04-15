import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CrossCloseButton extends StatelessWidget {
  const CrossCloseButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Spacing.spacing35,
        right: Spacing.spacing15,
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
