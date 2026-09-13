part of 'ds_modal_bottom_sheet.dart';

sealed class DsBottomSheetTitle {
  const DsBottomSheetTitle();
  const factory DsBottomSheetTitle.text(String data) = _DsBottomSheetTitleText;
  const factory DsBottomSheetTitle.widget(Widget child) =
      _DsBottomSheetTitleWidget;
}

final class _DsBottomSheetTitleText extends DsBottomSheetTitle {
  const _DsBottomSheetTitleText(this.data);
  final String data;
}

final class _DsBottomSheetTitleWidget extends DsBottomSheetTitle {
  const _DsBottomSheetTitleWidget(this.child);
  final Widget child;
}

sealed class DsBottomSheetDescription {
  const DsBottomSheetDescription();
  const factory DsBottomSheetDescription.text(String data) =
      _DsBottomSheetDescriptionText;
  const factory DsBottomSheetDescription.widget(Widget child) =
      _DsBottomSheetDescriptionWidget;
}

final class _DsBottomSheetDescriptionText extends DsBottomSheetDescription {
  const _DsBottomSheetDescriptionText(this.data);
  final String data;
}

final class _DsBottomSheetDescriptionWidget extends DsBottomSheetDescription {
  const _DsBottomSheetDescriptionWidget(this.child);
  final Widget child;
}

sealed class DsBottomSheetIcon {
  const DsBottomSheetIcon();
  const factory DsBottomSheetIcon.iconData(IconData data) =
      _DsBottomSheetIconData;
  const factory DsBottomSheetIcon.assetPath(String path) =
      _DsBottomSheetIconAsset;
}

final class _DsBottomSheetIconData extends DsBottomSheetIcon {
  const _DsBottomSheetIconData(this.data);
  final IconData data;
}

final class _DsBottomSheetIconAsset extends DsBottomSheetIcon {
  const _DsBottomSheetIconAsset(this.path);
  final String path;
}
