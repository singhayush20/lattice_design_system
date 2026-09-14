part of 'ds_list_tile.dart';

enum DsListTileVariant { defaultVariant, selectable, navigable }

sealed class DsListTileTitle {
  const DsListTileTitle();
  Widget build(BuildContext context, Color color);
}

final class DsListTileTitleBody extends DsListTileTitle {
  const DsListTileTitleBody(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.bodyLarge(data, color: color);
}

final class DsListTileTitleBodyMedium extends DsListTileTitle {
  const DsListTileTitleBodyMedium(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.bodyMedium(data, color: color);
}

final class DsListTileTitleHeadingSmall extends DsListTileTitle {
  const DsListTileTitleHeadingSmall(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.headlineSmall(data, color: color);
}

final class DsListTileTitleHeadingMedium extends DsListTileTitle {
  const DsListTileTitleHeadingMedium(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.headlineMedium(data, color: color);
}

final class DsListTileTitleLabelLarge extends DsListTileTitle {
  const DsListTileTitleLabelLarge(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.labelLarge(data, color: color);
}

final class DsListTileTitleCustom extends DsListTileTitle {
  const DsListTileTitleCustom(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context, Color color) => DefaultTextStyle(
        style: context.dsType.bodyLarge.copyWith(color: color),
        child: child,
      );
}

sealed class DsListTileSubtitle {
  const DsListTileSubtitle();
  Widget build(BuildContext context, Color color);
}

final class DsListTileSubtitleBody extends DsListTileSubtitle {
  const DsListTileSubtitleBody(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.bodyMedium(data, color: color);
}

final class DsListTileSubtitleBodySmall extends DsListTileSubtitle {
  const DsListTileSubtitleBodySmall(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.bodySmall(data, color: color);
}

final class DsListTileSubtitleLabel extends DsListTileSubtitle {
  const DsListTileSubtitleLabel(this.data);
  final String data;

  @override
  Widget build(BuildContext context, Color color) =>
      DsText.labelMedium(data, color: color);
}

final class DsListTileSubtitleCustom extends DsListTileSubtitle {
  const DsListTileSubtitleCustom(this.child);
  final Widget child;

  @override
  Widget build(BuildContext context, Color color) => DefaultTextStyle(
        style: context.dsType.bodyMedium.copyWith(color: color),
        child: child,
      );
}

sealed class DsListTileLeading {
  const DsListTileLeading();
  const factory DsListTileLeading.icon(IconData data) = _DsListTileLeadingIcon;
  const factory DsListTileLeading.asset(String path) = _DsListTileLeadingAsset;
  const factory DsListTileLeading.widget(Widget child) =
      _DsListTileLeadingWidget;

  Widget build({Color? color, double? size});
}

final class _DsListTileLeadingIcon extends DsListTileLeading {
  const _DsListTileLeadingIcon(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size24);
}

final class _DsListTileLeadingAsset extends DsListTileLeading {
  const _DsListTileLeadingAsset(this.path);
  final String path;

  @override
  Widget build({Color? color, double? size}) =>
      ImageIcon(AssetImage(path), color: color, size: size ?? DsSize.size24);
}

final class _DsListTileLeadingWidget extends DsListTileLeading {
  const _DsListTileLeadingWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}

sealed class DsListTileTrailing {
  const DsListTileTrailing();
  const factory DsListTileTrailing.icon(IconData data) =
      _DsListTileTrailingIcon;
  const factory DsListTileTrailing.widget(Widget child) =
      _DsListTileTrailingWidget;

  Widget build({Color? color, double? size});
}

final class _DsListTileTrailingIcon extends DsListTileTrailing {
  const _DsListTileTrailingIcon(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size20);
}

final class _DsListTileTrailingWidget extends DsListTileTrailing {
  const _DsListTileTrailingWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}
