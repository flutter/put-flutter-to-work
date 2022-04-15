import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_nps/l10n/l10n.dart';
import 'package:platform_close/platform_close.dart';

class CapturePage extends StatelessWidget {
  const CapturePage({Key? key}) : super(key: key);

  static const routeName = '/capture';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CaptureCubit(),
      child: const ResponsiveCard(child: CaptureView()),
    );
  }
}

class CaptureView extends StatelessWidget {
  const CaptureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxScore =
        context.select((CaptureCubit cubit) => cubit.state.maxScore);
    final selectedIndex =
        context.select((CaptureCubit cubit) => cubit.state.score - 1);
    final selectedChipIndexes = context.select(
      (CaptureCubit cubit) => cubit.state.chipIndexes,
    );
    final chips = [
      context.l10n.mediumText,
      context.l10n.mediumText,
      context.l10n.mediumText,
      context.l10n.veryLongText,
      context.l10n.mediumText,
      context.l10n.shortText,
      context.l10n.veryLongText,
    ];
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: Spacing.spacing35),
                const CircleAvatar(
                  maxRadius: Spacing.spacing40,
                  //themeing?
                  backgroundColor: NpsColors.colorSecondary,
                ),
                const SizedBox(height: Spacing.spacing35),
                Text(
                  context.l10n.captureTitle,
                  style: theme.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Spacing.spacing5),
                Text(
                  context.l10n.captureMessage,
                  style: theme.textTheme.subtitle1
                      ?.copyWith(color: NpsColors.colorGrey2),
                ),
                const SizedBox(height: Spacing.spacing35),
                CaptureScoreSelector(
                  maxScore: maxScore,
                  selectedIndex: selectedIndex,
                  selectedCallback: (index) => context
                      .read<CaptureCubit>()
                      .selectScore(score: index + 1),
                ),
                const SizedBox(height: Spacing.spacing15),
                CaptureScoreSelectorLabels(
                  maxLabel: context.l10n.captureMaxLabel,
                  minLabel: context.l10n.captureMinLabel,
                ),
                const SizedBox(height: Spacing.spacing35),
                BlocSelector<CaptureCubit, CaptureCubitState, bool>(
                  selector: (state) => state.isScoreSelected,
                  builder: (context, isScoreSelected) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 1500),
                      opacity: isScoreSelected ? 1.0 : 0.0,
                      child: Column(
                        children: [
                          AnswerChips(
                            chips: chips,
                            selectedChipsIndexes: selectedChipIndexes,
                            chipToogleCallback: (index) => context
                                .read<CaptureCubit>()
                                .chipToggled(index: index),
                          ),
                          const SizedBox(height: Spacing.spacing30),
                          SubmitButton(
                            buttonText: context.l10n.submit,
                            onPressed: context.select(
                              (CaptureCubit cubit) => cubit.state.canSubmit,
                            )
                                ? () {
                                    context.read<CaptureCubit>().submitResult();
                                    Navigator.pushReplacementNamed(
                                      context,
                                      CaptureEndPage.routeName,
                                    );
                                  }
                                : null,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: Spacing.spacing15),
              ],
            ),
          ),
        ),
        CrossCloseButton(
          onPressed: PlatformClose.instance.close,
        ),
      ],
    );
  }
}

extension on CaptureCubitState {
  bool get isScoreSelected => score != -1;
  bool get canSubmit => score != -1 && chipIndexes.isNotEmpty;
}
