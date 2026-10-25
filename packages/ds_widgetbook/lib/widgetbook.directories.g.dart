// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'widgetbook.dart';

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:ds_widgetbook/stories/atoms/button_stories.dart'
    as _ds_widgetbook_stories_atoms_button_stories;
import 'package:ds_widgetbook/stories/atoms/divider_stories.dart'
    as _ds_widgetbook_stories_atoms_divider_stories;
import 'package:ds_widgetbook/stories/atoms/input_stories.dart'
    as _ds_widgetbook_stories_atoms_input_stories;
import 'package:ds_widgetbook/stories/atoms/list_tile_stories.dart'
    as _ds_widgetbook_stories_atoms_list_tile_stories;
import 'package:ds_widgetbook/stories/atoms/progress_indicator_stories.dart'
    as _ds_widgetbook_stories_atoms_progress_indicator_stories;
import 'package:ds_widgetbook/stories/atoms/text_stories.dart'
    as _ds_widgetbook_stories_atoms_text_stories;
import 'package:ds_widgetbook/stories/foundations/color_stories.dart'
    as _ds_widgetbook_stories_foundations_color_stories;
import 'package:ds_widgetbook/stories/foundations/motion_stories.dart'
    as _ds_widgetbook_stories_foundations_motion_stories;
import 'package:ds_widgetbook/stories/foundations/radius_stories.dart'
    as _ds_widgetbook_stories_foundations_radius_stories;
import 'package:ds_widgetbook/stories/foundations/spacing_stories.dart'
    as _ds_widgetbook_stories_foundations_spacing_stories;
import 'package:ds_widgetbook/stories/foundations/typography_stories.dart'
    as _ds_widgetbook_stories_foundations_typography_stories;
import 'package:ds_widgetbook/stories/molecules/app_bar_stories.dart'
    as _ds_widgetbook_stories_molecules_app_bar_stories;
import 'package:ds_widgetbook/stories/molecules/image_stories.dart'
    as _ds_widgetbook_stories_molecules_image_stories;
import 'package:ds_widgetbook/stories/molecules/lottie_stories.dart'
    as _ds_widgetbook_stories_molecules_lottie_stories;
import 'package:ds_widgetbook/stories/molecules/modal_bottom_sheet_stories.dart'
    as _ds_widgetbook_stories_molecules_modal_bottom_sheet_stories;
import 'package:ds_widgetbook/stories/molecules/modal_dialog_stories.dart'
    as _ds_widgetbook_stories_molecules_modal_dialog_stories;
import 'package:ds_widgetbook/stories/molecules/shimmer_stories.dart'
    as _ds_widgetbook_stories_molecules_shimmer_stories;
import 'package:ds_widgetbook/stories/molecules/snack_bar_stories.dart'
    as _ds_widgetbook_stories_molecules_snack_bar_stories;
import 'package:ds_widgetbook/stories/molecules/text_field_stories.dart'
    as _ds_widgetbook_stories_molecules_text_field_stories;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookCategory(
    name: 'Atoms',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'Buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'All Variants',
                builder: _ds_widgetbook_stories_atoms_button_stories
                    .allVariantsUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Destructive',
                builder: _ds_widgetbook_stories_atoms_button_stories
                    .destructiveButtonUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Primary',
                builder: _ds_widgetbook_stories_atoms_button_stories
                    .primaryButtonUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Secondary',
                builder: _ds_widgetbook_stories_atoms_button_stories
                    .secondaryButtonUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Tertiary',
                builder: _ds_widgetbook_stories_atoms_button_stories
                    .tertiaryButtonUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Dividers',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsDivider',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Horizontal',
                builder: _ds_widgetbook_stories_atoms_divider_stories
                    .horizontalDividerUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Presets',
                builder: _ds_widgetbook_stories_atoms_divider_stories
                    .dividerPresetsUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Vertical',
                builder: _ds_widgetbook_stories_atoms_divider_stories
                    .verticalDividerUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Inputs',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsCheckboxListTile',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Checkbox List Tile',
                builder: _ds_widgetbook_stories_atoms_input_stories
                    .checkboxListTileUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsRadioListTile<String>',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Radio List Tile',
                builder: _ds_widgetbook_stories_atoms_input_stories
                    .radioListTileUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'List Tiles',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsListTile',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder: _ds_widgetbook_stories_atoms_list_tile_stories
                    .defaultListTileUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Navigable',
                builder: _ds_widgetbook_stories_atoms_list_tile_stories
                    .navigableListTileUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Selectable',
                builder: _ds_widgetbook_stories_atoms_list_tile_stories
                    .selectableListTileUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Progress Indicators',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsCircularProgressIndicator',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Circular Progress',
                builder: _ds_widgetbook_stories_atoms_progress_indicator_stories
                    .circularProgressUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Typography',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsText',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'All Variants',
                builder: _ds_widgetbook_stories_atoms_text_stories
                    .textVariantsUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookCategory(
    name: 'Foundations',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'Colors',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsColorScheme',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Color Palette',
                builder: _ds_widgetbook_stories_foundations_color_stories
                    .colorPaletteUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Motion',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsDurations',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Motion Tokens',
                builder: _ds_widgetbook_stories_foundations_motion_stories
                    .motionTokensUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Radius',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsRadius',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Border Radius',
                builder: _ds_widgetbook_stories_foundations_radius_stories
                    .radiusTokensUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Spacing',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsSize',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Size Tokens',
                builder: _ds_widgetbook_stories_foundations_spacing_stories
                    .sizeTokensUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsSpacing',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Spacing Tokens',
                builder: _ds_widgetbook_stories_foundations_spacing_stories
                    .spacingTokensUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Typography',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsText',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Typography Scale',
                builder: _ds_widgetbook_stories_foundations_typography_stories
                    .typographyScaleUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookCategory(
    name: 'Molecules',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'App Bars',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsAppBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'App Bar',
                builder: _ds_widgetbook_stories_molecules_app_bar_stories
                    .appBarUseCase,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'DsSliverAppBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'App Bar - With Sliver',
                builder: _ds_widgetbook_stories_molecules_app_bar_stories
                    .sliverAppBarUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Bottom Sheets',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Bottom Sheet - Non-Dismissible',
                builder:
                    _ds_widgetbook_stories_molecules_modal_bottom_sheet_stories
                        .modalBottomSheetNonDismissibleUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Bottom Sheet - Single Action',
                builder:
                    _ds_widgetbook_stories_molecules_modal_bottom_sheet_stories
                        .modalBottomSheetSingleActionUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Modal Bottom Sheet',
                builder:
                    _ds_widgetbook_stories_molecules_modal_bottom_sheet_stories
                        .modalBottomSheetUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Dialogs',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Dialog - Custom Icon',
                builder: _ds_widgetbook_stories_molecules_modal_dialog_stories
                    .modalDialogCustomIconUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Dialog - No Secondary Button',
                builder: _ds_widgetbook_stories_molecules_modal_dialog_stories
                    .modalDialogNoSecondaryUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Modal Dialog',
                builder: _ds_widgetbook_stories_molecules_modal_dialog_stories
                    .modalDialogUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Images',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsImage',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Asset Image Placeholder',
                builder: _ds_widgetbook_stories_molecules_image_stories
                    .assetImagePlaceholderUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Network Image',
                builder: _ds_widgetbook_stories_molecules_image_stories
                    .networkImageUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'SVG Network Image',
                builder: _ds_widgetbook_stories_molecules_image_stories
                    .svgNetworkImageUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Lottie',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsLottie',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Lottie - Loading Spinner',
                builder: _ds_widgetbook_stories_molecules_lottie_stories
                    .lottieLoadingUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Lottie - Success State',
                builder: _ds_widgetbook_stories_molecules_lottie_stories
                    .lottieSuccessUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Lottie Animation',
                builder: _ds_widgetbook_stories_molecules_lottie_stories
                    .lottieUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Shimmer',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsShimmer',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Shimmer',
                builder: _ds_widgetbook_stories_molecules_shimmer_stories
                    .shimmerUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Shimmer - Card List',
                builder: _ds_widgetbook_stories_molecules_shimmer_stories
                    .shimmerCardListUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Snack Bars',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Snack Bar',
                builder: _ds_widgetbook_stories_molecules_snack_bar_stories
                    .snackBarUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Snack Bar - Error',
                builder: _ds_widgetbook_stories_molecules_snack_bar_stories
                    .snackBarErrorUseCase,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'Snack Bar - With Custom Action',
                builder: _ds_widgetbook_stories_molecules_snack_bar_stories
                    .snackBarCustomActionUseCase,
              ),
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'Text Field',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'DsTextField',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Text Field',
                builder: _ds_widgetbook_stories_molecules_text_field_stories
                    .textFieldUseCase,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
