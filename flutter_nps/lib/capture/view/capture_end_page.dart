import 'package:flutter/material.dart';
import 'package:flutter_nps/capture/widget/responsive_card.dart';
import 'package:flutter_nps/texts.dart';

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
          const Image(image: AssetImage('assets/icons/check-circle.png')),
          const SizedBox(height: 35),
          Text(
            Texts.thankYou,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            Texts.feedbackSubmittedMessage,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
