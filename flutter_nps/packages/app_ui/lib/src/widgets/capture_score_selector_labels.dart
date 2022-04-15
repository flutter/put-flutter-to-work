import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CaptureScoreSelectorLabels extends StatelessWidget {
  const CaptureScoreSelectorLabels({
    Key? key,
    required this.minLabel,
    required this.maxLabel,
  }) : super(key: key);

  final String minLabel;
  final String maxLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Assets.icons.thumbDownEmoji
                .image(width: Spacing.spacing25, height: Spacing.spacing25),
            const SizedBox(width: Spacing.spacing10),
            Text(minLabel),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(maxLabel),
            const SizedBox(width: Spacing.spacing10),
            Assets.icons.lovingEmoji.image(
              width: Spacing.spacing25,
              height: Spacing.spacing25,
            )
          ],
        )
      ],
    );
  }
}
