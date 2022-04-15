import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:platform_close/platform_close.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({
    Key? key,
  }) : super(key: key);

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
          onPressed: PlatformClose.instance.close,
          icon: const Icon(Icons.close),
        ),
      ),
    );
  }
}
