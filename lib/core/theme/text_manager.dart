import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/shared/shared.dart';

abstract class TextManager {
  static TextStyle displayLarge = GoogleFonts.inter(
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static TextStyle headlineMedium = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );
}