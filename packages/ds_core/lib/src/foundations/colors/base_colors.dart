import 'package:flutter/material.dart';

/// Raw color palette - the foundation for all design system colors.
///
/// These colors should NOT be used directly in components.
/// Use semantic colors from [DsColorScheme] instead.
  final class BaseColors {
    const BaseColors._();

  // ==================== NEUTRAL PALETTE ====================
  // Shades from neutral-50 to neutral-900
  Color get neutral50 => const Color(0xFFFAFAF9);
  Color get neutral100 => const Color(0xFFF5F5F4);
  Color get neutral200 => const Color(0xFFE7E5E4);
  Color get neutral300 => const Color(0xFFD6D3D1);
  Color get neutral400 => const Color(0xFFA8A29E);
  Color get neutral500 => const Color(0xFF78716C);
  Color get neutral600 => const Color(0xFF57534E);
  Color get neutral700 => const Color(0xFF44403C);
  Color get neutral800 => const Color(0xFF292524);
  Color get neutral900 => const Color(0xFF1C1917);

  // ==================== PRIMARY BLUE PALETTE ====================
  // Shades from blue-50 to blue-900
  Color get blue50 => const Color(0xFFEFF6FF);
  Color get blue100 => const Color(0xFFDBEAFE);
  Color get blue200 => const Color(0xFFBFDBFE);
  Color get blue300 => const Color(0xFF93C5FD);
  Color get blue400 => const Color(0xFF60A5FA);
  Color get blue500 => const Color(0xFF3B82F6);
  Color get blue600 => const Color(0xFF2563EB);
  Color get blue700 => const Color(0xFF1D4ED8);
  Color get blue800 => const Color(0xFF1E40AF);
  Color get blue900 => const Color(0xFF1E3A8A);

  // ==================== SUCCESS GREEN PALETTE ====================
  Color get green50 => const Color(0xFFF0FDF4);
  Color get green100 => const Color(0xFFDCFCE7);
  Color get green200 => const Color(0xFFBBF7D0);
  Color get green300 => const Color(0xFF86EFAC);
  Color get green400 => const Color(0xFF4ADE80);
  Color get green500 => const Color(0xFF22C55E);
  Color get green600 => const Color(0xFF16A34A);
  Color get green700 => const Color(0xFF15803D);
  Color get green800 => const Color(0xFF166534);
  Color get green900 => const Color(0xFF14532D);

  // ==================== WARNING YELLOW PALETTE ====================
  Color get yellow50 => const Color(0xFFFEFCE8);
  Color get yellow100 => const Color(0xFFFEF9C3);
  Color get yellow200 => const Color(0xFFFEC84B);
  Color get yellow300 => const Color(0xFFFDE047);
  Color get yellow400 => const Color(0xFFFACC15);
  Color get yellow500 => const Color(0xFFEAB308);
  Color get yellow600 => const Color(0xFFCA8A04);
  Color get yellow700 => const Color(0xFFA16207);
  Color get yellow800 => const Color(0xFF854D0E);
  Color get yellow900 => const Color(0xFF713F12);

  // ==================== ERROR RED PALETTE ====================
  Color get red50 => const Color(0xFFFEE2E2);
  Color get red100 => const Color(0xFFFECACA);
  Color get red200 => const Color(0xFFFCA5A5);
  Color get red300 => const Color(0xFFF87171);
  Color get red400 => const Color(0xFFEF4444);
  Color get red500 => const Color(0xFFDC2626);
  Color get red600 => const Color(0xFFB91C1C);
  Color get red700 => const Color(0xFF991B1B);
  Color get red800 => const Color(0xFF7F1D1D);
  Color get red900 => const Color(0xFF450A0A);

  // ==================== INFO CYAN PALETTE ====================
  Color get cyan50 => const Color(0xFFECFEFF);
  Color get cyan100 => const Color(0xFFCFFAFE);
  Color get cyan200 => const Color(0xFFA5F3FC);
  Color get cyan300 => const Color(0xFF67E8F9);
  Color get cyan400 => const Color(0xFF22D3EE);
  Color get cyan500 => const Color(0xFF06B6D4);
  Color get cyan600 => const Color(0xFF0891B2);
  Color get cyan700 => const Color(0xFF0E7490);
  Color get cyan800 => const Color(0xFF155E75);
  Color get cyan900 => const Color(0xFF164E63);

  // ==================== PURPLE PALETTE ====================
  Color get purple50 => const Color(0xFFF5F3FF);
  Color get purple100 => const Color(0xFFEDE9FE);
  Color get purple200 => const Color(0xFFDDD6FE);
  Color get purple300 => const Color(0xFFC4B5FD);
  Color get purple400 => const Color(0xFFA78BFA);
  Color get purple500 => const Color(0xFF8B5CF6);
  Color get purple600 => const Color(0xFF7C3AED);
  Color get purple700 => const Color(0xFF6D28D9);
  Color get purple800 => const Color(0xFF5B21B6);
  Color get purple900 => const Color(0xFF4C1D95);

  // ==================== ORANGE PALETTE ====================
  Color get orange50 => const Color(0xFFFFF7ED);
  Color get orange100 => const Color(0xFFFFEDD5);
  Color get orange200 => const Color(0xFFFED7AA);
  Color get orange300 => const Color(0xFFFDBA74);
  Color get orange400 => const Color(0xFFFDBA74);
  Color get orange500 => const Color(0xFFF97316);
  Color get orange600 => const Color(0xFFEA580C);
  Color get orange700 => const Color(0xFFC2410C);
  Color get orange800 => const Color(0xFF9A3412);
  Color get orange900 => const Color(0xFF7C2D12);

  // ==================== TEAL PALETTE ====================
  Color get teal50 => const Color(0xFFF0FDFA);
  Color get teal100 => const Color(0xFFCCFBF1);
  Color get teal200 => const Color(0xFF99F6E4);
  Color get teal300 => const Color(0xFF5EEAD4);
  Color get teal400 => const Color(0xFF2DD4BF);
  Color get teal500 => const Color(0xFF14B8A6);
  Color get teal600 => const Color(0xFF0D9488);
  Color get teal700 => const Color(0xFF0F766E);
  Color get teal800 => const Color(0xFF115E59);
  Color get teal900 => const Color(0xFF134E4A);

  // ==================== BASIC COLORS ====================
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);
  Color get transparent => const Color(0x00000000);
}

/// Global instance of the base color palette
const BaseColors baseColors = BaseColors._();
