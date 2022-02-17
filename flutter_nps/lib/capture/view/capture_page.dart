import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nps/flutter_nps.dart';

class CapturePage extends StatelessWidget {
  const CapturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CaptureCubit(),
      child: const CaptureView(),
    );
  }
}

class CaptureView extends StatelessWidget {
  const CaptureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                IconButton(
                  onPressed: SystemNavigator.pop,
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const CircleAvatar(
              maxRadius: 85 / 2,
              backgroundColor: NpsColors.colorSecondary,
            ),
            const SizedBox(height: 32),
            Text(
              Texts.captureTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              Texts.captureMessage,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: NpsColors.colorGrey2),
            ),
            const SizedBox(height: 32),
            const CaptureScoreSelector(),
            const SizedBox(height: 16),
            const CaptureScoreSelectorLabels(),
            const SizedBox(height: 32),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1500),
              opacity:
                  context.watch<CaptureCubit>().isScoreSelected ? 1.0 : 0.0,
              child: Column(
                children: [
                  const AnswerChips(),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: context.watch<CaptureCubit>().canSubmit
                        ? context.read<CaptureCubit>().submitResult
                        : null,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 72,
                        vertical: 12,
                      ),
                      child: Text(
                        Texts.submit,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 55),
            // TODO(Jan-Stepien): implement Need Help button
            TextButton(
              onPressed: context.read<CaptureCubit>().callNeedHelp,
              child: Text(
                Texts.needHelp,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: NpsColors.colorBlueDash,
                      decoration: TextDecoration.underline,
                    ),
              ),
            )
          ],
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                context.select((CaptureCubit cubit) => cubit.state.score) - 1 ==
                        index
                    ? NpsColors.colorSecondary
                    : NpsColors.colorGrey5,
          ),
          child: TextButton(
            onPressed: () =>
                context.read<CaptureCubit>().selectScore(score: index + 1),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<CircleBorder>(
                const CircleBorder(),
              ),
              alignment: Alignment.center,
            ),
            child: Text(
              (index + 1).toString(),
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: context.select(
                                  (CaptureCubit cubit) => cubit.state.score,
                                ) -
                                1 ==
                            index
                        ? NpsColors.colorWhite
                        : NpsColors.colorPrimary1,
                  ),
            ),
          ),
        ),
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
          children: const [
            Text(
              '👎',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(width: 8),
            Text(Texts.captureMinLabel),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Text(Texts.captureMaxLabel),
            SizedBox(width: 8),
            Text(
              '😍',
              style: TextStyle(fontSize: 24),
            ),
          ],
        )
      ],
    );
  }
}

class AnswerChips extends StatelessWidget {
  const AnswerChips({Key? key}) : super(key: key);

  static const chips = [
    'Meduim',
    'Meduim',
    'Meduim',
    'Very very long text',
    'Meduim',
    'Short',
    'Very very long text',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: List<List<Widget>>.generate(
        chips.length,
        (index) => <Widget>[
          ActionChip(
            onPressed: () =>
                context.read<CaptureCubit>().state.chipIndexes.contains(index)
                    ? context.read<CaptureCubit>().removeChipIndex(index: index)
                    : context.read<CaptureCubit>().addChipIndex(index: index),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            label: Text(
              chips[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: context
                        .watch<CaptureCubit>()
                        .state
                        .chipIndexes
                        .contains(index)
                    ? NpsColors.colorWhite
                    : NpsColors.colorPrimary1,
              ),
            ),
            backgroundColor:
                context.watch<CaptureCubit>().state.chipIndexes.contains(index)
                    ? NpsColors.colorSecondary
                    : NpsColors.colorGrey5,
          ),
          const SizedBox(width: 8),
        ],
      ).reduce(
        (value, element) => [...value, ...element],
      ),
    );
  }
}
