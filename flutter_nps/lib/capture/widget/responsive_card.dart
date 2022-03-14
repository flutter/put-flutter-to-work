import 'package:flutter/material.dart';
import 'package:flutter_nps/breakpoints.dart';
import 'package:flutter_nps/colors.dart';

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
            backgroundColor: NpsColors.transparent,
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.small,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: child,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
