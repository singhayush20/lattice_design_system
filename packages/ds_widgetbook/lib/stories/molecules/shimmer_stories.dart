import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:ds_core/ds_core.dart';



@UseCase(name: 'Shimmer', type: DsShimmer, path: '[Molecules]/Shimmer')
Widget shimmerUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final color = context.knobs.colorOrNull(
    label: 'Shimmer Color',
    initialValue: null,
  );

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Shimmer Effect', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        DsShimmer(
          enabled: enabled,
          color: color,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 24,
                decoration: BoxDecoration(
                  color: context.dsColors.backgroundDisabled,
                  borderRadius: DsRadius.circular8,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 16,
                decoration: BoxDecoration(
                  color: context.dsColors.backgroundDisabled,
                  borderRadius: DsRadius.circular4,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 200,
                height: 16,
                decoration: BoxDecoration(
                  color: context.dsColors.backgroundDisabled,
                  borderRadius: DsRadius.circular4,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: context.dsColors.backgroundDisabled,
                      borderRadius: DsRadius.circularFull,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16,
                          decoration: BoxDecoration(
                            color: context.dsColors.backgroundDisabled,
                            borderRadius: DsRadius.circular4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 150,
                          height: 12,
                          decoration: BoxDecoration(
                            color: context.dsColors.backgroundDisabled,
                            borderRadius: DsRadius.circular4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

@UseCase(
  name: 'Shimmer - Card List',
  type: DsShimmer,
  path: '[Molecules]/Shimmer',
)
Widget shimmerCardListUseCase(BuildContext context) {
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final color = context.knobs.colorOrNull(
    label: 'Shimmer Color',
    initialValue: null,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Shimmer Card List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          DsShimmer(
            enabled: enabled,
            color: color,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.dsColors.backgroundSurface,
                  borderRadius: DsRadius.circular12,
                  border: Border.all(color: context.dsColors.borderDefault),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: context.dsColors.backgroundDisabled,
                        borderRadius: DsRadius.circular12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                              color: context.dsColors.backgroundDisabled,
                              borderRadius: DsRadius.circular4,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 180,
                            height: 14,
                            decoration: BoxDecoration(
                              color: context.dsColors.backgroundDisabled,
                              borderRadius: DsRadius.circular4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: context.dsColors.backgroundDisabled,
                        borderRadius: DsRadius.circularFull,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
