import 'package:news_app/core/theme/app_light_color.dart';
import 'package:news_app/core/theme/text_manager.dart';

import '../shared/shared.dart';

final lightColorScheme = ColorScheme.light(
  // Primary
  primary: AppLightColor.primaryColor,
  onPrimary: AppLightColor.backgroundColor,

  // Secondary
  secondary: AppLightColor.grayColor,
  onSecondary: AppLightColor.backgroundColor,

  // Surface
  surface: AppLightColor.backgroundColor,
  onSurface: AppLightColor.primaryColor,

  // Containers
  surfaceContainerHighest: AppLightColor.backgroundColor,
  surfaceContainer: AppLightColor.backgroundColor,

  // Variants
  onSurfaceVariant: AppLightColor.grayColor,

  // Outline
  outline: AppLightColor.grayColor,
  outlineVariant: AppLightColor.grayColor,

  // Error
  error: Colors.red,
  onError: AppLightColor.backgroundColor,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,

  iconTheme: IconThemeData(color: AppLightColor.backgroundColor, size: 24.r),

  textTheme: TextTheme(
    // Display
    displayLarge: TextManager.displayLarge.copyWith(
      color: AppLightColor.backgroundColor,
    ),

    // Headlines
    headlineLarge: TextManager.headlineLarge.copyWith(
      color: AppLightColor.primaryColor,
    ),

    headlineMedium: TextManager.headlineMedium.copyWith(
      color: AppLightColor.primaryColor,
    ),

    // Titles
    titleLarge: TextManager.titleLarge.copyWith(
      color: AppLightColor.primaryColor,
    ),

    titleMedium: TextManager.titleMedium.copyWith(
      color: AppLightColor.primaryColor,
    ),

    // Body
    bodyLarge: TextManager.bodyLarge.copyWith(
      color: AppLightColor.primaryColor,
    ),

    bodyMedium: TextManager.bodyMedium.copyWith(
      color: AppLightColor.primaryColor,
    ),

    bodySmall: TextManager.bodySmall.copyWith(color: AppLightColor.grayColor),

    // Labels
    labelLarge: TextManager.bodyLarge.copyWith(
      color: AppLightColor.backgroundColor,
    ),

    labelMedium: TextManager.bodyMedium.copyWith(
      color: AppLightColor.grayColor,
    ),

    labelSmall: TextManager.bodySmall.copyWith(
      color: AppLightColor.primaryColor,
      decoration: TextDecoration.underline,
      decorationColor: AppLightColor.primaryColor,
    ),
  ),
  tabBarTheme: TabBarThemeData(
    labelColor: AppLightColor.primaryColor,
    unselectedLabelColor: AppLightColor.primaryColor,
    indicatorSize: TabBarIndicatorSize.label,

    labelStyle: TextManager.bodyLarge,
    unselectedLabelStyle: TextManager.bodyMedium,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppLightColor.primaryColor, width: 2.w),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48.h),
      backgroundColor: AppLightColor.primaryColor,
      foregroundColor: AppLightColor.backgroundColor,
      textStyle: TextManager.titleMedium.copyWith(
        color: AppLightColor.backgroundColor,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    ),
  ),

  dividerTheme: const DividerThemeData(
    color: AppLightColor.backgroundColor,
    thickness: 1,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: AppLightColor.primaryColor,
    centerTitle: true,
    titleTextStyle: TextManager.titleLarge.copyWith(
      color: AppLightColor.primaryColor,
    ),
  ),
);
