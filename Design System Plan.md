# Master Plan: Flutter Design System Package

A consolidated architecture + phase-wise execution plan, incorporating everything finalized so far (layered components, theming with override support, responsive multiples-of-2 tokens, base/derived pattern, strict typing, Widgetbook, theme controller ownership).

---

## PART A: Overall Architecture Plan

### A.1 Goals Recap

|#|Goal|How it's satisfied|
|---|---|---|
|1|Atomic layers|`atoms/ → molecules/ → organisms/ → templates/` folder hierarchy, each layer only depends on layers below it|
|2|Raw + derived colors|`_BaseColors` (raw palette) + `DsColorScheme extends ThemeExtension` (semantic, overridable)|
|3|Light/dark theme|`DsTheme.light()` / `DsTheme.dark()` build `ThemeData` with `extensions: [DsColorScheme, DsTypeScale]`|
|4|Full override support|`DsColorScheme.copyWith(...)` at app root, or `DsThemeOverride` for scoped subtree overrides|
|5|Reusable, strictly typed|Sealed classes for all content slots (titles, actions, icons, messages) instead of raw `Widget`|
|6–7|Atoms/Molecules/Organisms/Templates catalog|Defined component list per layer|
|8|Base/Derived pattern|`base_xxx.dart` (raw building, `part of`) + `ds_xxx.dart` (named constructors per variant)|
|9|Responsive, multiples of 2|`DsSize`, `DsRadius`, `DsSpacing` (vertical/horizontal/radial) — all `.r/.w/.h` scaled getters|
|10|OOP + Flutter best practices|Const constructors, `StatelessWidget` everywhere, no functional widgets, strict lints|
|11|Extensible|Documented contribution contract, CI-enforced Widgetbook coverage|
|12|Widgetbook|Dedicated `ds_widgetbook` package as the sole interactive surface (no demo app)|
|13|Theme mode control|`DsThemeModeController` (ChangeNotifier) + `DsThemeScope` (InheritedNotifier) shipped by package; instance owned by consumer app|

### A.2 Repository Structure


```
ds_workspace/
  melos.yaml
  analysis_options.yaml         # shared strict lint rules
  packages/
    ds_core/                    # publishable design system package
    ds_widgetbook/               # interactive sandbox / living style guide / QA tool
```

### A.3 `ds_core` Internal Structure (final)


```
ds_core/lib/
  ds_core.dart                              # single public barrel
  src/
    foundations/
      colors/
        base_colors.dart                    # part file, private _BaseColors
        ds_color_scheme.dart                # ThemeExtension<DsColorScheme>
        ds_colors_x.dart                    # context.dsColors
      typography/
        ds_font_family.dart
        ds_type_scale.dart                  # ThemeExtension<DsTypeScale>
        ds_text_style_x.dart                # context.dsType
      sizing/
        ds_size.dart                        # size2, size4, size6...
      radius/
        ds_radius.dart                      # radius2, radius4, circular8...
      spacing/
        ds_spacing.dart                     # verticalSpaceN, horizontalSpaceN, radialSpaceN
      elevation/
        ds_elevation.dart
      motion/
        ds_durations.dart
        ds_curves.dart
      breakpoints/
        ds_breakpoints.dart
      responsive/
        ds_responsive.dart                  # init() + .w/.h/.r/.sp
        ds_responsive_builder.dart
      icons/
        ds_icons.dart
    theme/
      ds_theme.dart                         # ThemeData.light()/dark()
      ds_theme_overrides.dart               # DsThemeOverride scoped widget
      ds_theme_mode_controller.dart         # ChangeNotifier
      ds_theme_scope.dart                   # InheritedNotifier
    shared/
      types/                                # sealed content-slot base types
      enums/                                # DsVariant, DsSize enums shared across components
      mixins/
    atoms/
      buttons/ | typography/ | badges/ | list_tiles/ | avatars/
      chips/ | dividers/ | checkboxes/ | radios/ | switches/ | loaders/ | icons/ | tooltips/
    molecules/
      text_fields/ | search_bars/ | bottom_sheets/ | dialogs/
      cards/ | snackbars/ | app_bars/ | dropdown_fields/ | segmented_controls/
    organisms/
      navigation_bars
    templates/
      <empty for now>
  test/
    foundations/ | atoms/ | molecules/ | organisms/ | templates/
    goldens/
  pubspec.yaml
  CONTRIBUTING.md
  CHANGELOG.md
  README.md
```

### A.4 Non-Negotiable Contracts (apply to every future component)

1. **3-file pattern**: `ds_xxx.dart` (public, named constructors) + `base_xxx.dart` (`part of`, raw build logic) + `ds_xxx_style.dart` (enums + style/color resolver).
2. **No raw `Widget` slots** for structured content — always a `sealed class` with named factory constructors (`.text()`, `.rich()`, `.custom()`, `.icon()`, `.asset()` etc.), rendered via exhaustive `switch`.
3. **No hardcoded values** — colors from `context.dsColors`, text styles from `context.dsType`, spacing/sizing/radius from `DsSpacing`/`DsSize`/`DsRadius`, all of which are responsive-aware.
4. **No booleans for variants** — always enums (`DsButtonVariant`, `DsBadgeStatus`) switched exhaustively.
5. **Const constructors wherever possible**; `StatelessWidget` unless internal transient UI state is unavoidable (then `StatefulWidget`, never functional builder-widgets).
6. **Every public widget → Widgetbook UseCase** (CI-enforced).
7. **New color token → added to `DsColorScheme` fields + both factories + `copyWith` + `lerp`**, never a loose static constant.

---

## PART B: Phase-Wise Implementation Plan

Each phase has: **Objective, Tasks, Deliverables, Exit Criteria**. Effort units are relative (S/M/L/XL) rather than calendar days, since team size varies — but I've included a suggested week estimate assuming 1–2 engineers.

---

### **Phase 0 — Workspace & Tooling Bootstrap** (Effort: S, ~3–4 days)

**Objective:** Set up the monorepo skeleton, lint rules, CI pipeline, and package scaffolding before any component work begins.

**Tasks:**

- Initialize `ds_workspace` with `melos.yaml`; configure `melos bootstrap`.
- Create `ds_core` and `ds_widgetbook` packages with base `pubspec.yaml`.
- Write shared `analysis_options.yaml` (strict lints: `prefer_const_constructors`, `avoid_returning_widgets`, no functional widgets, exhaustive switch enforcement).
- Set up GitHub Actions: format → analyze → test stages (empty for now, structure only).
- Write `CONTRIBUTING.md` with the full component-authoring contract (Section A.4).
- Set up `CHANGELOG.md` and semantic versioning convention.

**Deliverables:** Empty but fully wired monorepo; CI green on a no-op commit.

**Exit Criteria:** `melos run analyze` and `melos run test` pass with zero code; CI pipeline triggers on PR.

---

### **Phase 1 — Foundations Layer** (Effort: L, ~1.5–2 weeks)

**Objective:** Build every token system components will depend on. Nothing in later phases can start meaningfully without this.

**Tasks:**

1. **Colors**
    - `base_colors.dart` — full raw palette (blue/red/green/yellow/orange/purple/teal/neutral + black/white/transparent), each with 100–800 (or 50–900) shades.
    - `DsColorScheme extends ThemeExtension<DsColorScheme>` — every semantic field from the original `DsColors` example, migrated to instance fields.
    - `DsColorScheme.light()` and `.dark()` factories.
    - `copyWith()` and `lerp()` — full field coverage (consider generating these via a script/codegen to avoid manual drift as fields grow).
    - `context.dsColors` extension.
2. **Typography**
    - `DsTypeScale extends ThemeExtension<DsTypeScale>` — display/headline/title/body/label × large/medium/small.
    - `.standard()` factory using `.sp` scaling.
    - `context.dsType` extension.
3. **Sizing/Radius/Spacing**
    - `DsSize` (size2...size160), `DsRadius` (radius2...radiusFull + circularN wrappers), `DsSpacing` (vertical/horizontal/radialSpaceN) — all as documented.
4. **Elevation & Motion**
    - `DsElevation` (shadow presets per level), `DsDurations` (fast/medium/slow), `DsCurves`.
5. **Responsive System**
    - `DsResponsive.init()`, `.w/.h/.r/.sp` extensions, tested against multiple `MediaQuery` sizes.
    - `DsBreakpoints` (mobile/tablet/desktop) + `DsResponsiveBuilder`.
6. **Theme Assembly**
    - `DsTheme.light()/dark()` combining `DsColorScheme` + `DsTypeScale` into `ThemeData`.
    - `DsThemeOverride` scoped-override widget.
    - `DsThemeModeController` + `DsThemeScope`.

**Deliverables:** Fully functional foundations layer, unit-tested, exported via `ds_core.dart`.

**Exit Criteria:**

- Unit tests: `copyWith`/`lerp` correctness, `DsResponsive` math correctness across ≥3 screen sizes.
- A throwaway `MaterialApp` (temporary, deleted before merge, or a Widgetbook "Foundations" use case — see Phase 6) visually confirms light/dark theme switch and color override work.
- 100% of tokens accessible only via getters/extensions — no raw `Color`/`double` leaking into public API.

---
**Phase 1.1** **Addiing BaseColors and derived colors**
The BaseColors will consist of the complete raw color palette with different colors and there shades.
The derived colors will consist of following-
```dart
### 1. Brand & Core Colors

- `primary`
- `primaryLight`
- `primaryDark`
- `secondary`
- `secondaryLight`
- `secondaryDark`
- `onPrimary`
- `onSecondary`

### 2. Background Colors

- `backgroundPrimary`
- `backgroundSurface`
- `backgroundSubtle`
- `backgroundSuccess`
- `backgroundEnabled`
- `backgroundWarning`
- `backgroundError`
- `backgroundInfo`
- `backgroundDisabled`

### 5. Text Colors

- `textPrimary`
- `textSecondary`
- `textTertiary`
- `textDisabled`
- `textOnDark`
- `textLink`
- `textSuccess`
- `textWarning`
- `textError`
- `textAccent`

### 6. Border Colors

- `borderDefault`
- `borderDefaultSecondary`
- `borderSubtle`
- `borderDisabled`
- `borderPrimary`
- `borderSuccess`
- `borderWarning`
- `borderError`
- `borderInfo`

### 7. Button Colors - Primary

- `buttonPrimary`
- `buttonPrimaryHover`
- `buttonPrimaryDisabled`
- `buttonPrimaryText`
- `buttonPrimaryTextDisabled`
- `buttonPrimaryPressed`

### 8. Button Colors - Secondary

- `buttonSecondary`
- `buttonSecondaryBorder`
- `buttonSecondaryText`
- `buttonSecondaryHover`
- `buttonSecondaryDisabled`
- `buttonSecondaryPressed`
- `buttonSecondaryBorderDisabled`

### 9. Button Colors - Tertiary

- `buttonTertiaryText`
- `buttonTertiaryHover`

### 10. Button Colors - Destructive

- `buttonDestructive`
- `buttonDestructiveHover`
- `buttonDestructiveDisabled`
- `buttonDestructiveText`

### 11. Text Field Colors

- `textFieldBackground`
- `textFieldText`
- `textFieldBorder`
- `textFieldBorderFocused`
- `textFieldBorderHover`
- `textFieldBorderDisabled`
- `textFieldBorderError`
- `textFieldBorderSuccess`
- `textFieldBackgroundDisabled`
- `textFieldTextDisabled`
- `textFieldHint`
- `textFieldCursor`
- `textFieldCursorError`
- `textFieldLabel`
- `textFieldLabelFocused`
- `textFieldHelper`
- `textFieldErrorText`
- `textFieldSuccessText`

### 12. Icon Colors

- `iconPrimary`
- `iconSecondary`
- `iconDisabled`
- `iconOnPrimary`
- `iconSuccess`
- `iconWarning`
- `iconError`
- `iconInfo`

### 13. Semantic State Colors

- `success`
- `warning`
- `error`
- `info`

### 14. Utility & Gradient Colors

- `navigationBarShadow`
- `overlayColor`
- `dividerColor`
- `dividerColorSecondary`
- `transparent`
- `white`
- `black`
- `gradientStart`
- `gradientEnd`
- `loadingIndicatorColorPrimary`
  
```

*Important note: Any kind of component created in the design system must use colors from the derived colors and no random colors from base colors or hardcoded Color().*

### **Phase 2 — Atoms Layer** (Effort: XL, ~3 weeks)

**Objective:** Build the foundational component set every molecule/organism will compose.

**Component build order** (simplest → most reused elsewhere, so later atoms can depend on earlier ones):

|Order|Component|Variants|Sealed types needed|
|---|---|---|---|
|1|`DsText`|display/headline/title/body/label × sizes|—|
|2|`DsIcon`|standard/inverted/circle-background|`DsIconSource` (icon/asset/svg)|
|3|`DsDivider`|horizontal/vertical, solid/dashed|—|
|4|`DsButton`|primary/secondary/tertiary/destructive/icon-only|`DsButtonIcon`|
|5|`DsBadge`|success/warning/error/info/neutral, dot/label|`DsBadgeContent`|
|6|`DsAvatar`|image/initials/icon|`DsAvatarSource`|
|7|`DsChip`|filled/outlined, selectable/deletable|`DsChipLabel`|
|8|`DsCheckbox` / `DsRadio` / `DsSwitch`|default/disabled/error|—|
|9|`DsLoadingIndicator`|small/medium/large, linear/circular|—|
|10|`DsTooltip`|default|`DsTooltipContent`|
|11|`DsListTile`|default/selectable/navigable|`DsListTileTitle/Subtitle/Leading/Trailing`|

**Tasks per component (repeat for all 11):**

- `ds_xxx_style.dart` (enums + resolver reading `context.dsColors`/`dsType`).
- `base_xxx.dart` (raw build).
- `ds_xxx.dart` (named constructors).
- Sealed content-slot types where applicable.
- Widget tests (variant rendering, tap callbacks, disabled states).
- Golden tests (light/dark × mobile/tablet).

**Deliverables:** Full atoms directory, exported, tested.

**Exit Criteria:**

- Every atom has ≥1 test per named constructor.
- Every atom renders correctly with a **color-overridden** `DsColorScheme` (regression check for Req 5).
- No atom contains a hardcoded `Color(0xFF...)`, raw `EdgeInsets`, or magic number outside token references.

---

### **Phase 3 — Molecules Layer** (Effort: L, ~2–2.5 weeks)

**Objective:** Compose atoms into interactive, commonly reused UI patterns.

|Component|Variants|Depends on|
|---|---|---|
|`DsTextField`|outlined/filled/underline/chat-input|`DsText`, sealed `DsTextFieldLabel/Hint/Error/Helper`|
|`DsSearchBar`|default/with-filter-icon|`DsTextField`, `DsIcon`|
|`DsDropdownField`|single-select|`DsTextField`, `DsListTile`|
|`DsCard`|elevated/outlined/filled|`DsText`|
|`DsSnackbar`|success/error/warning/info|`DsIcon`, `DsText`|
|`DsAppBar`|standard/with-actions/search|`DsIcon`, `DsText`|
|`DsBottomSheet`|list/form/confirmation|`DsListTile`, `DsButton`|
|`DsDialog`|alert/confirm/custom|`DsButton`, sealed `DsDialogTitle/Message/Action`|
|`DsSegmentedControl`|2–4 segment options|`DsText`|

**Tasks:** Same per-component contract as Phase 2, plus:

- For `DsDialog`/`DsBottomSheet`/`DsSnackbar`: static `.show()`/`.confirm()` helper methods that wrap `showDialog`/`showModalBottomSheet`/`ScaffoldMessenger` — keeping the imperative trigger API ergonomic while internals stay declarative.

**Deliverables:** Full molecules directory, exported, tested.

**Exit Criteria:**

- Interaction tests: dialog returns correct value on confirm/cancel, bottom sheet dismiss behavior, text field validation states render correctly.
- Golden coverage for at least the default variant of each molecule across light/dark.

---

### **Phase 4 — Organisms Layer** (Effort: M, ~1.5–2 weeks)

**Objective:** Build larger, feature-oriented composite sections.

| Component         | Composition                                                                    |
| ----------------- | ------------------------------------------------------------------------------ |
| `DsNavigationBar` | `DsIcon` + `DsText` + `DsBadge` (for notification counts)                      |
| `DsFormSection`   | `DsText` (section header) + arbitrary `DsTextField`/`DsDropdownField` children |
| `DsListSection`   | `DsText` (header) + `List<DsListTile>` + optional `DsDivider`                  |
| `DsEmptyState`    | `DsIcon`/illustration slot + `DsText` + `DsButton` (CTA)                       |
| `DsErrorState`    | Similar to EmptyState with retry action                                        |


**Tasks:** Same 3-file contract; each organism accepts **typed collections** (e.g., `List<DsListTileData>` rather than `List<Widget>`) to preserve type safety at composition boundaries.

**Deliverables:** Full organisms directory.

**Exit Criteria:** Each organism tested in isolation with mock data across both themes; verified they inherit color overrides correctly through nested atom/molecule usage (no organism should re-hardcode a color already resolved by its children).

---

### **Phase 5 — Templates Layer** (Effort: M, ~1–1.5 weeks)

**Objective:** Provide full-page scaffolding with responsive layout behavior baked in.

**No items here for now!**

**Tasks:**

- Each template built on top of `DsResponsiveBuilder` with explicit `mobile`/`tablet`/`desktop` slots (falling back gracefully if only `mobile` is provided).
- Widget tests using `tester.binding.window.physicalSizeTestValue` to simulate each breakpoint and assert correct layout branch renders.

**Deliverables:** Full templates directory.

**Exit Criteria:** Each template verified visually (via Widgetbook `DeviceFrameAddon`) at ≥3 breakpoints in both themes.

---

### **Phase 6 — Widgetbook Workbook (Full Build-Out)** (Effort: M, runs _parallel_ to Phases 2–5, finalized here)

> Note: In practice, a `UseCase` should be added **immediately after each component is built** in Phases 2–5, not deferred. This phase is the **hardening and completeness pass**.

**Tasks:**

- Ensure every public widget from Phases 1–5 has a corresponding `@widgetbook.UseCase` per named constructor.
- Build "Foundations" use cases: color palette swatch grid, typography specimen sheet, spacing/radius/size token visualizer.
- Configure addons: `MaterialThemeAddon` (light/dark), custom `DsColorScheme` override knob addon, `DeviceFrameAddon` (mobile/tablet/desktop), `TextScaleAddon`.
- Organize categorization: `[Foundations]`, `[Atoms]/[...]`, `[Molecules]/[...]`, `[Organisms]/[...]`, `[Templates]/[...]`.
- Build the CI script that diffs exported symbols in `ds_core.dart` against generated Widgetbook use-case registry → fails PR if any public component lacks coverage.

**Deliverables:** Fully populated, navigable Widgetbook app.

**Exit Criteria:** `melos run widgetbook:build` succeeds; CI coverage-check script passes with 100% component coverage.

---

### **Phase 7 — Testing & Golden Hardening** (Effort: M, ~1 week, overlaps end of Phase 6) (SKIP)

**Objective:** Close testing gaps accumulated across phases; establish long-term regression safety net.

**Tasks:**

- Audit test coverage per component; backfill missing widget/unit tests.
- Run full golden suite generation (`--update-goldens`) and commit baseline images.
- Add CI stage: golden diff check (fail PR on visual regression, require explicit `--update-goldens` commit to approve intentional changes).
- Add mutation-style sanity tests for theme override propagation (e.g., swap `primary` color, assert every dependent atom reflects it).

**Deliverables:** `test/goldens/` baseline; CI golden-diff gate active.

**Exit Criteria:** ≥85% line coverage on `src/`; golden gate blocks unreviewed visual changes.

---

### **Phase 8 — Documentation & v1.0.0 Release** (Effort: S, ~3–5 days) (SKIP)

**Tasks:**

- Dartdoc comments on all public classes/members (required for `pub.dev` scoring if published publicly).
- `README.md`: installation, theme setup snippet, override example, link to hosted/CI-deployed Widgetbook (if applicable).
- Per-layer `README.md` (optional) explaining atomic design rationale for contributors.
- Finalize `CHANGELOG.md` for `1.0.0`.
- Run `melos version` to tag and version packages consistently.
- `flutter pub publish --dry-run` validation (or push to private pub server / git dependency tag if internal-only).

**Deliverables:** Published/tagged `v1.0.0` of `ds_core`.

**Exit Criteria:** Package installable by a fresh consumer app via path/git/pub dependency with zero manual setup beyond `DsTheme` + `DsResponsive.init()`.

---

### **Phase 9 — Post-v1.0: Ongoing Extensibility** (Continuous)

**Tasks:**

- Enforce `CONTRIBUTING.md` checklist via PR template.
- Backlog for future components (e.g., `DsStepper`, `DsCarousel`, `DsCalendar`, `DsSkeletonLoader`).
- Optional: Figma token sync pipeline (design tokens JSON → codegen into `DsColorScheme`/`DsSpacing`) to keep design/code in lockstep.
- Periodic Widgetbook Cloud/CI screenshot review integration for design sign-off on new components.
- Deprecation policy: mark old APIs `@Deprecated('Use X instead')` for ≥1 minor version before removal.

---

## PART C: Timeline Summary

|Phase|Duration (est., 1–2 devs)|Cumulative|
|---|---|---|
|0. Bootstrap|3–4 days|Week 0.5|
|1. Foundations|1.5–2 weeks|Week 2.5|
|2. Atoms|3 weeks|Week 5.5|
|3. Molecules|2–2.5 weeks|Week 8|
|4. Organisms|1.5–2 weeks|Week 10|
|5. Templates|1–1.5 weeks|Week 11.5|
|6. Widgetbook hardening|(parallel) + 3–4 days buffer|Week 12|
|7. Testing hardening|~1 week|Week 13|
|8. Docs & Release|3–5 days|Week 13.5–14|

**Total: ~14 weeks for a 1–2 engineer team to reach a production-grade v1.0.0.** Can compress significantly with more engineers working atoms/molecules/organisms in parallel once Phase 1 foundations are locked (foundations must be 100% stable first — every later phase depends on it).

---

## PART D: Key Risks & Mitigations

|Risk|Mitigation|
|---|---|
|`DsColorScheme` grows to 100+ fields, `copyWith`/`lerp` become unwieldy/error-prone|Write a small internal codegen script (or use `freezed`-style pattern) to generate `copyWith`/`lerp` from a token list, reducing manual boilerplate risk|
|Foundations change late, causing cascading rework in atoms/molecules|Freeze Phase 1 with a explicit sign-off/review gate before Phase 2 starts|
|Widgetbook coverage drifts out of sync as components are added quickly|CI-enforced coverage-diff script (Phase 6) makes this a hard gate, not a convention|
|Responsive scaling causes inconsistent sizing on desktop/web (very wide screens)|Clamp scale factors in `DsResponsive` (as already designed) + dedicated desktop breakpoint testing in Phase 5/7|
|Sealed-type slots feel verbose to consumers for simple cases|Provide ergonomic default factory shortcuts (e.g., `DsListTileTitle.text(...)` is the 95% case) so verbosity only appears for advanced/custom usage|
|Team members bypass contracts under deadline pressure (raw `Color`, boolean flags)|Custom lint rule / PR template checklist + code review gate referencing `CONTRIBUTING.md`|

This plan gives you a clear dependency-ordered execution path — **foundations must be rock-solid before anything else starts**, atoms before molecules, molecules before organisms, and Widgetbook/testing treated as first-class parallel tracks rather than an afterthought.

## Example of a design system component
### Text
#### 1. Typography Component (`DsText`)

Typography is an Atom. It wraps Flutter's `Text` widget but strictly enforces the use of the `DsTypeScale` theme extension and standardized variants.

##### File: `ds_text_style.dart` (Enums & Types)

```dart
import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

/// Defines the strict variants allowed for typography.
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

/// Strictly-typed content slot for Text.
/// Prevents passing arbitrary widgets where text is expected.
sealed class DsTextContent {
  const DsTextContent();
  
  /// Standard plain text.
  const factory DsTextContent.text(String data) = _DsTextContentPlain;
  
  /// Rich text using InlineSpan.
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
```

##### File: `base_text.dart` (Raw Building Logic)


```dart
part of 'ds_text.dart';

base class BaseText extends StatelessWidget {
  const BaseText({
    super.key,
    required this.content,
    required this.variant,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
  });

  final DsTextContent content;
  final DsTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    // 1. Resolve the base TextStyle from the ThemeExtension
    final typeScale = context.dsType;
    final baseStyle = _resolveStyle(typeScale);

    // 2. Apply optional overrides (like color)
    final effectiveStyle = baseStyle.copyWith(
      color: color,
    );

    // 3. Render based on the strictly-typed content slot
    return switch (content) {
      _DsTextContentPlain(:final data) => Text(
          data,
          style: effectiveStyle,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
        ),
      _DsTextContentRich(:final span) => Text.rich(
          span,
          style: effectiveStyle,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
          softWrap: softWrap,
        ),
    };
  }

  /// Maps the enum variant to the ThemeExtension token.
  /// Exhaustive switch ensures we never forget a style.
  TextStyle _resolveStyle(DsTypeScale typeScale) => switch (variant) {
        DsTextVariant.displayLarge => typeScale.displayLarge,
        DsTextVariant.displayMedium => typeScale.displayMedium,
        DsTextVariant.displaySmall => typeScale.displaySmall,
        DsTextVariant.headlineLarge => typeScale.headlineLarge,
        DsTextVariant.headlineMedium => typeScale.headlineMedium,
        DsTextVariant.headlineSmall => typeScale.headlineSmall,
        DsTextVariant.titleLarge => typeScale.titleLarge,
        DsTextVariant.titleMedium => typeScale.titleMedium,
        DsTextVariant.titleSmall => typeScale.titleSmall,
        DsTextVariant.bodyLarge => typeScale.bodyLarge,
        DsTextVariant.bodyMedium => typeScale.bodyMedium,
        DsTextVariant.bodySmall => typeScale.bodySmall,
        DsTextVariant.labelLarge => typeScale.labelLarge,
        DsTextVariant.labelMedium => typeScale.labelMedium,
        DsTextVariant.labelSmall => typeScale.labelSmall,
      };
}
```

##### File: `ds_text.dart` (Public API & Named Constructors)

```dart
import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_text.dart';
part 'ds_text_style.dart';

/// The public, sealed component for Typography.
/// 
/// Usage: DsText.bodyLarge('Hello World')
final class DsText extends BaseText {
  // --- Display ---
  const DsText.displayLarge(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.displayLarge, content: _DsTextContentPlain(_data));
  const DsText.displayMedium(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.displayMedium, content: _DsTextContentPlain(_data));
  const DsText.displaySmall(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.displaySmall, content: _DsTextContentPlain(_data));

  // --- Headline ---
  const DsText.headlineLarge(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.headlineLarge, content: _DsTextContentPlain(_data));
  const DsText.headlineMedium(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.headlineMedium, content: _DsTextContentPlain(_data));
  const DsText.headlineSmall(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.headlineSmall, content: _DsTextContentPlain(_data));

  // --- Title ---
  const DsText.titleLarge(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.titleLarge, content: _DsTextContentPlain(_data));
  const DsText.titleMedium(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.titleMedium, content: _DsTextContentPlain(_data));
  const DsText.titleSmall(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.titleSmall, content: _DsTextContentPlain(_data));

  // --- Body ---
  const DsText.bodyLarge(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.bodyLarge, content: _DsTextContentPlain(_data));
  const DsText.bodyMedium(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.bodyMedium, content: _DsTextContentPlain(_data));
  const DsText.bodySmall(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.bodySmall, content: _DsTextContentPlain(_data));

  // --- Label ---
  const DsText.labelLarge(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.labelLarge, content: _DsTextContentPlain(_data));
  const DsText.labelMedium(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.labelMedium, content: _DsTextContentPlain(_data));
  const DsText.labelSmall(this._data, {super.key, super.color, super.textAlign, super.overflow, super.maxLines, super.softWrap})
      : super(variant: DsTextVariant.labelSmall, content: _DsTextContentPlain(_data));

  // Private string field used to make the named constructors clean
  // (Allows passing string directly without wrapping in DsTextContent.text manually)
  final String _data;
}
```

#### 2. Button Component (`DsButton`)

Button is an Atom. It demonstrates how to use `DsSize`, `DsSpacing`, `context.dsColors`, how to compose other Atoms (`DsText`), and how to handle strictly-typed icon slots.

##### File: `ds_button_style.dart` (Enums, Types, Style Resolvers)


```dart
import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

enum DsButtonVariant { primary, secondary, tertiary, destructive }
enum DsButtonSize { small, medium, large }

/// Strictly-typed slot for Button Icons.
/// Prevents passing arbitrary widgets where an icon configuration is expected.
sealed class DsButtonIcon {
  const DsButtonIcon();
  
  /// Standard Material IconData
  const factory DsButtonIcon.icon(IconData data) = _DsButtonIconData;
  
  /// Asset image path
  const factory DsButtonIcon.asset(String path) = _DsButtonIconAsset;
  
  /// Escape hatch for custom animation/widget icons
  const factory DsButtonIcon.widget(Widget child) = _DsButtonIconWidget;

  Widget build({Color? color, double? size});
}

final class _DsButtonIconData extends DsButtonIcon {
  const _DsButtonIconData(this.data);
  final IconData data;
  
  @override
  Widget build({Color? color, double? size}) => Icon(data, color: color, size: size ?? DsSize.size20);
}

final class _DsButtonIconAsset extends DsButtonIcon {
  const _DsButtonIconAsset(this.path);
  final String path;
  
  @override
  Widget build({Color? color, double? size}) => ImageIcon(AssetImage(path), color: color, size: size ?? DsSize.size20);
}

final class _DsButtonIconWidget extends DsButtonIcon {
  const _DsButtonIconWidget(this.child);
  final Widget child;
  
  @override
  Widget build({Color? color, double? size}) => child;
}

/// Private helper to resolve Material ButtonStyle from DS tokens.
/// This keeps the build method clean.
class _DsButtonStyleResolver {
  static ButtonStyle resolve({
    required DsButtonVariant variant,
    required DsButtonSize size,
    required DsColorScheme colors,
  }) {
    // 1. Resolve Sizing via DsSize
    final double height = switch (size) {
      DsButtonSize.small => DsSize.size32,
      DsButtonSize.medium => DsSize.size40,
      DsButtonSize.large => DsSize.size48,
    };

    final EdgeInsetsGeometry padding = switch (size) {
      DsButtonSize.small => EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace12),
      DsButtonSize.medium => EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace16),
      DsButtonSize.large => EdgeInsets.symmetric(horizontal: DsSpacing.horizontalSpace24),
    };

    // 2. Resolve Colors via exhaustive switch
    final Color foregroundColor;
    final Color backgroundColor;
    final Color overlayColor;
    final Color disabledForegroundColor;
    final Color disabledBackgroundColor;

    switch (variant) {
      case DsButtonVariant.primary:
        foregroundColor = colors.onPrimary;
        backgroundColor = colors.buttonPrimary;
        overlayColor = colors.buttonPrimaryHover;
        disabledForegroundColor = colors.buttonPrimaryTextDisabled;
        disabledBackgroundColor = colors.buttonPrimaryDisabled;
        break;
      case DsButtonVariant.secondary:
        foregroundColor = colors.buttonSecondaryText;
        backgroundColor = colors.buttonSecondary;
        overlayColor = colors.buttonSecondaryHover;
        disabledForegroundColor = colors.buttonPrimaryTextDisabled; 
        disabledBackgroundColor = colors.buttonSecondaryDisabled;
        break;
      case DsButtonVariant.tertiary:
        foregroundColor = colors.buttonTertiaryText;
        backgroundColor = Colors.transparent;
        overlayColor = colors.buttonTertiaryHover;
        disabledForegroundColor = colors.buttonPrimaryTextDisabled;
        disabledBackgroundColor = Colors.transparent;
        break;
      case DsButtonVariant.destructive:
        foregroundColor = colors.buttonDestructiveText;
        backgroundColor = colors.buttonDestructive;
        overlayColor = colors.buttonDestructiveHover;
        disabledForegroundColor = colors.buttonDestructiveText;
        disabledBackgroundColor = colors.buttonDestructiveDisabled;
        break;
    }

    // 3. Construct Material ButtonStyle
    return ElevatedButton.styleFrom(
      minimumSize: Size(height, height), // Forces square constraints if needed
      padding: padding,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      shape: RoundedRectangleBorder(borderRadius: DsRadius.circular8),
      elevation: 0,
      // Note: Hover/Pressed states can be refined with MaterialStateProperty
    );
  }
}
```

##### File: `base_button.dart` (Raw Building Logic)


```dart
part of 'ds_button.dart';

base class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.data,
    required this.variant,
    this.size = DsButtonSize.medium,
    this.onTap,
    this.leading,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String data;
  final VoidCallback? onTap;
  final DsButtonIcon? leading;
  final DsButtonVariant variant;
  final DsButtonSize size;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsColors;
    final style = _DsButtonStyleResolver.resolve(
      variant: variant,
      size: size,
      colors: colors,
    );

    // Resolve text color for the icon (icons inherit foregroundColor from ButtonStyle usually, 
    // but if we use a custom layout, we might need to pass it explicitly)
    final iconColor = style.foregroundColor?.resolve({}) ?? colors.onPrimary;

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        style: style,
        onPressed: isLoading ? null : onTap,
        child: AnimatedSize(
          duration: DsDurations.fast,
          curve: DsCurves.standard,
          child: isLoading
              ? Padding(
                  padding: EdgeInsets.all(DsSpacing.radialSpace4),
                  // Composing another Atom!
                  child: DsLoadingIndicator.small(color: iconColor),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) ...[
                      leading!.build(color: iconColor),
                      SizedBox(width: DsSpacing.horizontalSpace8),
                    ],
                    // Composing the Typography Atom!
                    DsText.labelLarge(data),
                  ],
                ),
        ),
      ),
    );
  }
}
```

##### File: `ds_button.dart` (Public API & Named Constructors)


```dart
import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

part 'base_button.dart';
part 'ds_button_style.dart';

/// The public, sealed component for Buttons.
/// 
/// Usage: DsButton.primary('Submit', onTap: () {})
final class DsButton extends BaseButton {
  const DsButton.primary(
    this._data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.primary, data: _data);

  const DsButton.secondary(
    this._data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.secondary, data: _data);

  const DsButton.tertiary(
    this._data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.tertiary, data: _data);

  const DsButton.destructive(
    this._data, {
    super.key,
    super.onTap,
    super.leading,
    super.size,
    super.isLoading,
    super.isFullWidth,
  }) : super(variant: DsButtonVariant.destructive, data: _data);

  final String _data;
}
```

---

## Summary of the Convention Set Above:

1. **File Structure:** 3 files per component (`ds_xxx.dart`, `base_xxx.dart`, `ds_xxx_style.dart`).
2. **Encapsulation:** `base class BaseXxx` handles the raw `build` method and logic. It is `part of` the main file and invisible to the public API.
3. **API Surface:** `final class DsXxx` exposes clean named constructors mapping to the enum variants. It is impossible to instantiate an incomplete button.
4. **Strict Typing:** Slots like `leading` take `DsButtonIcon?`, not `Widget?`. This forces consumers to use `.icon()` or `.asset()`, allowing the DS to control sizing and coloring uniformly.
5. **Exhaustive Switching:** Resolvers and renders use Dart 3 exhaustive `switch` statements. If a new variant is added to `DsButtonVariant`, the compiler will force developers to update the style resolver and the derived class constructors.
6. **Token Integration:** No `Color(0xFF...)`, no `16.0` padding. Everything routes through `context.dsColors`, `DsSpacing`, or `DsSize`.
7. **Composability:** Atoms compose other Atoms (`DsButton` uses `DsText.labelLarge` and `DsLoadingIndicator`), ensuring global typography/theme changes cascade perfectly down the tree.