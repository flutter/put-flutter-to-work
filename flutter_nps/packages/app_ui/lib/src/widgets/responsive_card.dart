import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
            body: SizedBox.expand(child: child),
          );
        } else {
          return Scaffold(
            backgroundColor: NpsColors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: Breakpoints.small,
                      maxWidth: Breakpoints.small,
                    ),
                    child: Card(
                      surfaceTintColor: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
