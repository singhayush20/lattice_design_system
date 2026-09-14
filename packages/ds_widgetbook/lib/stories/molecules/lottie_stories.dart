import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Lottie Animation', type: DsLottie, path: '[Molecules]/Lottie')
Widget lottieUseCase(BuildContext context) {
  final lottieUrl = context.knobs.string(
    label: 'Lottie URL',
    initialValue: 'https://assets9.lottiefiles.com/packages/lf20_uxjajpn9.json',
  );
  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 200,
    min: 100,
    max: 400,
    divisions: 30,
  );
  final height = context.knobs.double.slider(
    label: 'Height',
    initialValue: 200,
    min: 100,
    max: 400,
    divisions: 30,
  );
  final fit = context.knobs.object.dropdown<BoxFit>(
    label: 'Fit',
    options: BoxFit.values,
    initialOption: BoxFit.contain,
    labelBuilder: (v) => v.name,
  );
  final repeat = context.knobs.boolean(label: 'Repeat', initialValue: true);
  final reverse = context.knobs.boolean(label: 'Reverse', initialValue: false);
  final animate = context.knobs.boolean(label: 'Animate', initialValue: true);

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Lottie Animation',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        DsLottie(
          lottieUrl: lottieUrl,
          width: width,
          height: height,
          fit: fit,
          repeat: repeat,
          reverse: reverse,
          animate: animate,
        ),
        const SizedBox(height: 16),
        Text(
          'URL: $lottieUrl',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

@UseCase(
  name: 'Lottie - Loading Spinner',
  type: DsLottie,
  path: '[Molecules]/Lottie',
)
Widget lottieLoadingUseCase(BuildContext context) {
  final lottieUrl = context.knobs.string(
    label: 'Lottie URL',
    initialValue: 'https://assets1.lottiefiles.com/packages/lf20_jtbfg2nb.json',
  );
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 80,
    min: 40,
    max: 200,
    divisions: 16,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Loading Spinner', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        DsLottie(
          lottieUrl: lottieUrl,
          width: size,
          height: size,
          fit: BoxFit.contain,
          repeat: true,
          animate: true,
        ),
        const SizedBox(height: 16),
        Text(
          'Loading...',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ),
  );
}

@UseCase(
  name: 'Lottie - Success State',
  type: DsLottie,
  path: '[Molecules]/Lottie',
)
Widget lottieSuccessUseCase(BuildContext context) {
  final lottieUrl = context.knobs.string(
    label: 'Lottie URL',
    initialValue: 'https://assets10.lottiefiles.com/packages/lf20_3vbOcw.json',
  );
  final size = context.knobs.double.slider(
    label: 'Size',
    initialValue: 200,
    min: 100,
    max: 300,
    divisions: 20,
  );
  final repeat = context.knobs.boolean(label: 'Repeat', initialValue: false);

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Success Animation',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        DsLottie(
          lottieUrl: lottieUrl,
          width: size,
          height: size,
          fit: BoxFit.contain,
          repeat: repeat,
          animate: true,
        ),
        const SizedBox(height: 16),
        Text(
          'Success!',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: context.dsColors.success),
        ),
      ],
    ),
  );
}
