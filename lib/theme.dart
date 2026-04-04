import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBreakpoints {
  static const double mobile = 768;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

class AppOpacity {
  static const double subtle = 0.08;
  static const double light = 0.14;
  static const double medium = 0.25;
  static const double strong = 0.50;
}

// Warm earthy dark — complements the beige/tan welcome banner
class AppColors {
  static const background = Color(0xFF1A1714);     // warm dark brown
  static const surface = Color(0xFF2A2520);         // warm surface
  static const surfaceLight = Color(0xFF3A342E);    // lighter warm
  static const primary = Color(0xFFD4A66A);         // warm caramel/gold
  static const secondaryAccent = Color(0xFF7DCEA0); // sage green
  static const textWhite = Color(0xFFF5F0EB);       // warm white
  static const textPrimary = Color(0xFFF5F0EB);
  static const textSecondary = Color(0xFFB5ADA5);   // warm gray
  static const divider = Color(0xFFE8E0D8);         // warm divider
  static const buttonTextLight = Color(0xFF1A1714);

  static const navSurface = Color(0xE61A1714);
  static const navBorder = Color(0x22E8E0D8);
}

class AppFonts {
  static String get heading => GoogleFonts.outfit().fontFamily!;
  static const String body = 'Inter';
}

class AppTextStyles {
  static TextStyle get sectionTitle => TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColors.textPrimary,
  );

  static const sectionSubtitle = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    height: 1.7,
    color: AppColors.textSecondary,
  );

  static TextStyle get cardTitle => TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: AppColors.textPrimary,
  );

  static const cardSubtitle = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 15,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static const body = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 16,
    height: 1.7,
    color: AppColors.textSecondary,
  );

  static TextStyle get dialogTitle => TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColors.textWhite,
  );

  static TextStyle get dialogSectionTitle => TextStyle(
    fontFamily: AppFonts.heading,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const navLabel = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const toolsLabel = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static const metaLabel = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: AppColors.secondaryAccent,
  );

  static const metaValue = TextStyle(
    fontFamily: AppFonts.body,
    fontSize: 14,
    height: 1.5,
    color: AppColors.textSecondary,
  );
}

class AppButtonStyles {
  static final primaryButton = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.buttonTextLight,
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
    textStyle: const TextStyle(
      fontFamily: AppFonts.body,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static final secondaryButton = OutlinedButton.styleFrom(
    foregroundColor: AppColors.textPrimary,
    side: BorderSide(color: AppColors.divider.withOpacity(AppOpacity.medium)),
    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
    textStyle: const TextStyle(
      fontFamily: AppFonts.body,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
