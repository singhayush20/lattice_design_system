import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';

@UseCase(
  name: 'Motion Tokens',
  type: DsDurations,
  path: '[Foundations]/Motion',
)
Widget motionTokensUseCase(BuildContext context) {
  final durations = <String, Duration>{
    'instant': DsDurations.instant,
    'fast': DsDurations.fast,
    'medium': DsDurations.medium,
    'slow': DsDurations.slow,
  };

  final curves = <String, Curve>{
    'linear': Curves.linear,
    'standard': DsCurves.standard,
    'decelerate': DsCurves.decelerate,
    'accelerate': DsCurves.accelerate,
    'bounce': DsCurves.bounce,
  };

  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Motion Tokens', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          'Durations and easing curves used across the design system',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 24),
        _DurationsSection(title: 'Durations', durations: durations),
        const SizedBox(height: 32),
        _CurvesSection(title: 'Easing Curves', curves: curves),
      ],
    ),
  );
}

class _DurationsSection extends StatelessWidget {
  const _DurationsSection({
    required this.title,
    required this.durations,
  });

  final String title;
  final Map<String, Duration> durations;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final keys = durations.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: keys.map((key) {
            final duration = durations[key]!;
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.backgroundSurface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.borderDefault),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    key,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colors.textSecondary,
                          fontFamily: 'monospace',
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${duration.inMilliseconds}ms',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: colors.textPrimary,
                          fontFamily: 'monospace',
                        ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _CurvesSection extends StatefulWidget {
  const _CurvesSection({
    required this.title,
    required this.curves,
  });

  final String title;
  final Map<String, Curve> curves;

  @override
  State<_CurvesSection> createState() => _CurvesSectionState();
}

class _CurvesSectionState extends State<_CurvesSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  String? _selectedCurveKey;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: DsDurations.medium,
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _selectedCurveKey = widget.curves.keys.first;
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateCurve(String key) {
    setState(() {
      _selectedCurveKey = key;
      _animation = CurvedAnimation(
        parent: _controller,
        curve: widget.curves[key]!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final keys = widget.curves.keys.toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: keys.map((key) {
            final isSelected = _selectedCurveKey == key;
            return FilterChip(
              label: Text(key),
              selected: isSelected,
              onSelected: (_) => _updateCurve(key),
              selectedColor: colors.primary.withValues(alpha: 0.15),
              checkmarkColor: colors.primary,
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colors.backgroundSurface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.borderDefault),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    _animation.value * 200 - 100,
                    0,
                  ),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: DsRadius.circular12,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}