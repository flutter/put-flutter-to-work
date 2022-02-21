import 'package:flutter/material.dart';
import 'package:flutter_nps/breakpoints.dart';

class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        if (boxConstraints.maxWidth <= Breakpoints.small) {
          return Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            body: child,
          );
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 558,
                  maxWidth: Breakpoints.small,
                ),
                child: Card(child: child),
              ),
            ),
          );
        }
      },
    );
  }
}
