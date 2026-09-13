part of 'ds_radio_list_tile.dart';

enum DsRadioListTileVariant { defaultVariant, dense }

sealed class DsRadioListTileTitle {
  const DsRadioListTileTitle();
  const factory DsRadioListTileTitle.text(String data) =
      _DsRadioListTileTitleText;
  const factory DsRadioListTileTitle.widget(Widget child) =
      _DsRadioListTileTitleWidget;
}

final class _DsRadioListTileTitleText extends DsRadioListTileTitle {
  const _DsRadioListTileTitleText(this.data);
  final String data;
}

final class _DsRadioListTileTitleWidget extends DsRadioListTileTitle {
  const _DsRadioListTileTitleWidget(this.child);
  final Widget child;
}

sealed class DsRadioListTileSubtitle {
  const DsRadioListTileSubtitle();
  const factory DsRadioListTileSubtitle.text(String data) =
      _DsRadioListTileSubtitleText;
  const factory DsRadioListTileSubtitle.widget(Widget child) =
      _DsRadioListTileSubtitleWidget;
}

final class _DsRadioListTileSubtitleText extends DsRadioListTileSubtitle {
  const _DsRadioListTileSubtitleText(this.data);
  final String data;
}

final class _DsRadioListTileSubtitleWidget extends DsRadioListTileSubtitle {
  const _DsRadioListTileSubtitleWidget(this.child);
  final Widget child;
}

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

sealed class DsRadioListTileValue<T> {
  const DsRadioListTileValue();
  const factory DsRadioListTileValue.value(T value) = _DsRadioListTileValue<T>;
}

final class _DsRadioListTileValue<T> extends DsRadioListTileValue<T> {
  const _DsRadioListTileValue(this.value);
  final T value;
}
