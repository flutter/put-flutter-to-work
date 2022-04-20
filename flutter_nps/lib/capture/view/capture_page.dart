import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nps/capture/capture.dart';
import 'package:flutter_nps/colors.dart';
import 'package:flutter_nps/gen/assets.gen.dart';
import 'package:flutter_nps/l10n/l10n.dart';
import 'package:nps_repository/nps_repository.dart';
import 'package:platform_close/platform_close.dart';

class CapturePage extends StatelessWidget {
  const CapturePage({Key? key}) : super(key: key);

  static const routeName = '/capture';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CaptureCubit(
        npsRepository: const NpsRepository(),
      ),
      child: const ResponsiveCard(child: CaptureView()),
    );
  }
}

class CaptureView extends StatelessWidget {
  const CaptureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const CircleAvatar(
                  maxRadius: 85 / 2,
                  backgroundColor: NpsColors.colorSecondary,
                ),
                const SizedBox(height: 32),
                Text(
                  context.l10n.captureTitle,
                  style: theme.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  context.l10n.captureMessage,
                  style: theme.textTheme.subtitle1
                      ?.copyWith(color: NpsColors.colorGrey2),
                ),
                const SizedBox(height: 32),
                const CaptureScoreSelector(),
                const SizedBox(height: 16),
                const CaptureScoreSelectorLabels(),
                const SizedBox(height: 32),
                BlocSelector<CaptureCubit, CaptureCubitState, bool>(
                  selector: (state) => state.isScoreSelected,
                  builder: (context, isScoreSelected) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 1500),
                      opacity: isScoreSelected ? 1.0 : 0.0,
                      child: Column(
                        children: const [
                          AnswerChips(),
                          SizedBox(height: 32),
                          _SubmitButton(),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 55),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, right: 15),
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: PlatformClose.instance.close,
              icon: const Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canSubmit = context.select(
      (CaptureCubit cubit) => cubit.state.canSubmit,
    );
    return ElevatedButton(
      key: const Key('capturePage_submit_elevatedButton'),
      onPressed: canSubmit
          ? () {
              context.read<CaptureCubit>().submitResult();
              Navigator.pushReplacementNamed(context, CaptureEndPage.routeName);
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 72,
          vertical: 12,
        ),
        child: Text(
          context.l10n.submit,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CaptureScoreSelector extends StatelessWidget {
  const CaptureScoreSelector({Key? key, this.radius = 30}) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final maxScore = context.select(
      (CaptureCubit cubit) => cubit.state.maxScore,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        maxScore,
        (index) {
          final isSelected = context.select(
            (CaptureCubit cubit) => cubit.state.score - 1 == index,
          );
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: radius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isSelected ? NpsColors.colorSecondary : NpsColors.colorGrey5,
            ),
            child: TextButton(
              onPressed: () {
                context.read<CaptureCubit>().selectScore(score: index + 1);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<CircleBorder>(
                  const CircleBorder(),
                ),
                alignment: Alignment.center,
              ),
              child: Text(
                (index + 1).toString(),
                style: theme.textTheme.subtitle1?.copyWith(
                  color: isSelected
                      ? NpsColors.colorWhite
                      : NpsColors.colorPrimary1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CaptureScoreSelectorLabels extends StatelessWidget {
  const CaptureScoreSelectorLabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Assets.icons.thumbDownEmoji.image(width: 24, height: 24),
            const SizedBox(width: 8),
            Text(context.l10n.captureMinLabel),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(context.l10n.captureMaxLabel),
            const SizedBox(width: 8),
            Assets.icons.lovingEmoji.image(width: 24, height: 24)
          ],
        )
      ],
    );
  }
}

class AnswerChips extends StatelessWidget {
  const AnswerChips({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final chips = [
      context.l10n.mediumText,
      context.l10n.mediumText,
      context.l10n.mediumText,
      context.l10n.veryLongText,
      context.l10n.mediumText,
      context.l10n.shortText,
      context.l10n.veryLongText,
    ];
    return Wrap(
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: List<List<Widget>>.generate(
        chips.length,
        (index) {
          final isSelected = context.select(
            (CaptureCubit cubit) => cubit.state.chipIndexes.contains(index),
          );
          return <Widget>[
            ActionChip(
              onPressed: () {
                context.read<CaptureCubit>().chipToggled(index: index);
              },
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              label: Text(
                chips[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? NpsColors.colorWhite
                      : NpsColors.colorPrimary1,
                ),
              ),
              backgroundColor:
                  isSelected ? NpsColors.colorSecondary : NpsColors.colorGrey5,
            ),
            const SizedBox(width: 8),
          ];
        },
      ).reduce((value, element) => [...value, ...element]),
    );
  }
}

extension on CaptureCubitState {
  bool get isScoreSelected => score != -1;
  bool get canSubmit => score != -1 && chipIndexes.isNotEmpty;
}
