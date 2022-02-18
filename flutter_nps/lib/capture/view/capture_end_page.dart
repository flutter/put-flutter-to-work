import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_nps/gen/assets.gen.dart';
import 'package:flutter_nps/l10n/l10n.dart';

class CaptureEndPage extends StatelessWidget {
  const CaptureEndPage({Key? key}) : super(key: key);

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.checkCircle.image(),
          const SizedBox(height: 35),
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
    );
  }
}
