part of 'ds_list_tile.dart';

enum DsListTileVariant { defaultVariant, selectable, navigable }

sealed class DsListTileTitle {
  const DsListTileTitle();
  const factory DsListTileTitle.text(String data) = _DsListTileTitleText;
  const factory DsListTileTitle.widget(Widget child) = _DsListTileTitleWidget;

  Widget build(BuildContext context, Color color) {
    return switch (this) {
      _DsListTileTitleText(:final data) => DsText.bodyLarge(data, color: color),
      _DsListTileTitleWidget(:final child) => DefaultTextStyle(
        style: context.dsType.bodyLarge.copyWith(color: color),
        child: child,
      ),
    };
  }
}

final class _DsListTileTitleText extends DsListTileTitle {
  const _DsListTileTitleText(this.data);
  final String data;
}

final class _DsListTileTitleWidget extends DsListTileTitle {
  const _DsListTileTitleWidget(this.child);
  final Widget child;
}

sealed class DsListTileSubtitle {
  const DsListTileSubtitle();
  const factory DsListTileSubtitle.text(String data) = _DsListTileSubtitleText;
  const factory DsListTileSubtitle.widget(Widget child) =
      _DsListTileSubtitleWidget;

  Widget build(BuildContext context, Color color) {
    return switch (this) {
      _DsListTileSubtitleText(:final data) => DsText.bodyMedium(
        data,
        color: color,
      ),
      _DsListTileSubtitleWidget(:final child) => DefaultTextStyle(
        style: context.dsType.bodyMedium.copyWith(color: color),
        child: child,
      ),
    };
  }
}

final class _DsListTileSubtitleText extends DsListTileSubtitle {
  const _DsListTileSubtitleText(this.data);
  final String data;
}

final class _DsListTileSubtitleWidget extends DsListTileSubtitle {
  const _DsListTileSubtitleWidget(this.child);
  final Widget child;
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
