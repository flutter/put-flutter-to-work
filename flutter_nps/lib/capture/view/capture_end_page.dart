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
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.checkCircle.image(),
              const SizedBox(height: Spacing.spacing35),
              Text(
                context.l10n.thankYou,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                context.l10n.feedbackSubmittedMessage,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: Spacing.spacing35,
            right: Spacing.spacing15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: PlatformClose.instance.close,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
