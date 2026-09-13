part of 'ds_text.dart';

enum DsTextVariant {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

sealed class DsTextContent {
  const DsTextContent();
  const factory DsTextContent.text(String data) = _DsTextContentPlain;
  const factory DsTextContent.rich(InlineSpan span) = _DsTextContentRich;
}

final class _DsTextContentPlain extends DsTextContent {
  const _DsTextContentPlain(this.data);
  final String data;
}

final class _DsTextContentRich extends DsTextContent {
  const _DsTextContentRich(this.span);
  final InlineSpan span;
}
