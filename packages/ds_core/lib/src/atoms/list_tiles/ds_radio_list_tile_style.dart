part of 'ds_radio_list_tile.dart';

enum DsRadioListTileVariant { defaultVariant, dense }

sealed class DsRadioListTileLeading {
  const DsRadioListTileLeading();
  const factory DsRadioListTileLeading.icon(IconData data) =
      _DsRadioListTileLeadingIcon;
  const factory DsRadioListTileLeading.asset(String path) =
      _DsRadioListTileLeadingAsset;
  const factory DsRadioListTileLeading.widget(Widget child) =
      _DsRadioListTileLeadingWidget;

  Widget build({Color? color, double? size});
}

final class _DsRadioListTileLeadingIcon extends DsRadioListTileLeading {
  const _DsRadioListTileLeadingIcon(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size24);
}

final class _DsRadioListTileLeadingAsset extends DsRadioListTileLeading {
  const _DsRadioListTileLeadingAsset(this.path);
  final String path;

  @override
  Widget build({Color? color, double? size}) =>
      ImageIcon(AssetImage(path), color: color, size: size ?? DsSize.size24);
}

final class _DsRadioListTileLeadingWidget extends DsRadioListTileLeading {
  const _DsRadioListTileLeadingWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}

sealed class DsRadioListTileTrailing {
  const DsRadioListTileTrailing();
  const factory DsRadioListTileTrailing.icon(IconData data) =
      _DsRadioListTileTrailingIcon;
  const factory DsRadioListTileTrailing.widget(Widget child) =
      _DsRadioListTileTrailingWidget;

  Widget build({Color? color, double? size});
}

final class _DsRadioListTileTrailingIcon extends DsRadioListTileTrailing {
  const _DsRadioListTileTrailingIcon(this.data);
  final IconData data;

  @override
  Widget build({Color? color, double? size}) =>
      Icon(data, color: color, size: size ?? DsSize.size20);
}

final class _DsRadioListTileTrailingWidget extends DsRadioListTileTrailing {
  const _DsRadioListTileTrailingWidget(this.child);
  final Widget child;

  @override
  Widget build({Color? color, double? size}) => child;
}
