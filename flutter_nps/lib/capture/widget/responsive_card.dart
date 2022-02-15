import 'package:flutter/material.dart';

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        if (boxConstraints.maxWidth <= 511) {
          return Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            body: child,
          );
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxHeight: 558, maxWidth: 511),
                child: Card(child: child),
              ),
            ),
          );
        }
      },
    );
  }
}
