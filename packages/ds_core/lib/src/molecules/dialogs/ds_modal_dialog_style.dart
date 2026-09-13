part of 'ds_modal_dialog.dart';

sealed class DsDialogTitle {
  const DsDialogTitle();
  const factory DsDialogTitle.text(String data) = _DsDialogTitleText;
  const factory DsDialogTitle.widget(Widget child) = _DsDialogTitleWidget;
}

final class _DsDialogTitleText extends DsDialogTitle {
  const _DsDialogTitleText(this.data);
  final String data;
}

final class _DsDialogTitleWidget extends DsDialogTitle {
  const _DsDialogTitleWidget(this.child);
  final Widget child;
}

sealed class DsDialogDescription {
  const DsDialogDescription();
  const factory DsDialogDescription.text(String data) =
      _DsDialogDescriptionText;
  const factory DsDialogDescription.widget(Widget child) =
      _DsDialogDescriptionWidget;
}

final class _DsDialogDescriptionText extends DsDialogDescription {
  const _DsDialogDescriptionText(this.data);
  final String data;
}

final class _DsDialogDescriptionWidget extends DsDialogDescription {
  const _DsDialogDescriptionWidget(this.child);
  final Widget child;
}

sealed class DsDialogIcon {
  const DsDialogIcon();
  const factory DsDialogIcon.iconData(IconData data) = _DsDialogIconData;
  const factory DsDialogIcon.assetPath(String path) = _DsDialogIconAsset;
}

final class _DsDialogIconData extends DsDialogIcon {
  const _DsDialogIconData(this.data);
  final IconData data;
}

final class _DsDialogIconAsset extends DsDialogIcon {
  const _DsDialogIconAsset(this.path);
  final String path;
}
