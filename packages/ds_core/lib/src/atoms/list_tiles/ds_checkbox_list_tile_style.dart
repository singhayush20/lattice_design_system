part of 'ds_checkbox_list_tile.dart';

enum DsCheckboxListTileVariant { defaultVariant, dense }

sealed class DsCheckboxListTileLeading {
  const DsCheckboxListTileLeading();
  const factory DsCheckboxListTileLeading.icon(IconData data) =
      _DsCheckboxListTileLeadingIcon;
  const factory DsCheckboxListTileLeading.asset(String path) =
      _DsCheckboxListTileLeadingAsset;
  const factory DsCheckboxListTileLeading.widget(Widget child) =
      _DsCheckboxListTileLeadingWidget;

  Widget build({Color? color, double? size});
}

final class _DsCheckboxListTileLeadingIcon extends DsCheckboxListTileLeading {
  const _DsCheckboxListTileLeadingIcon(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size24);
}

final class _DsCheckboxListTileLeadingAsset extends DsCheckboxListTileLeading {
  const _DsCheckboxListTileLeadingAsset(this.path);
  final String path;

  @override
  Widget build({Color? color, double? size}) =>
      ImageIcon(AssetImage(path), color: color, size: size ?? DsSize.size24);
}

final class _DsCheckboxListTileLeadingWidget extends DsCheckboxListTileLeading {
  const _DsCheckboxListTileLeadingWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}

sealed class DsCheckboxListTileTrailing {
  const DsCheckboxListTileTrailing();
  const factory DsCheckboxListTileTrailing.icon(IconData data) =
      _DsCheckboxListTileTrailingIcon;
  const factory DsCheckboxListTileTrailing.widget(Widget child) =
      _DsCheckboxListTileTrailingWidget;

  Widget build({Color? color, double? size});
}

final class _DsCheckboxListTileTrailingIcon extends DsCheckboxListTileTrailing {
  const _DsCheckboxListTileTrailingIcon(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size20);
}

final class _DsCheckboxListTileTrailingWidget
    extends DsCheckboxListTileTrailing {
  const _DsCheckboxListTileTrailingWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}
