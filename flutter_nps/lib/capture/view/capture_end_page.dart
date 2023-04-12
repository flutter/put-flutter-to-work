import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nps/l10n/l10n.dart';
import 'package:platform_close/platform_close.dart';

class CaptureEndPage extends StatelessWidget {
  const CaptureEndPage({Key? key}) : super(key: key);

  static const routeName = '/end';

  @override
  Widget build(BuildContext context) {
    return const ResponsiveCard(
      child: CaptureEndView(),
    );
  }
}

class CaptureEndView extends StatelessWidget {
  const CaptureEndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: Spacing.huge),
            Assets.icons.checkCircle.image(),
            const SizedBox(height: Spacing.xl),
            Text(
              context.l10n.thankYou,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              context.l10n.feedbackSubmittedMessage,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: Spacing.xxhuge),
          ],
        ),
        Positioned(
          top: Spacing.xl,
          right: Spacing.s,
          child: IconButton(
            onPressed: PlatformClose.instance.close,
            icon: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
