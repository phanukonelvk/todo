import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_example/widgets/app_size_config.dart';

class AppTextStyles {
  // displayLarge
  static TextStyle? displayLarge = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 6.8,
  );

// displayMedium
  static TextStyle? displayMedium = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 6.5,
  );

// displaySmall
  static TextStyle? displaySmall = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 6.2,
  );

// headlineLarge
  static TextStyle? headlineLarge = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 5.8,
  );

// headlineMedium
  static TextStyle? headlineMedium = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 5.5,
  );

// headlineSmall
  static TextStyle? headlineSmall = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 5.2,
  );

// titleLarge
  static TextStyle? titleLarge = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 4.8,
  );
// titleMedium
  static TextStyle? titleMedium = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 4.5,
  );
// titleSmall
  static TextStyle? titleSmall = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 4.2,
  );
// bodyLarge
  static TextStyle? bodyLarge = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 3.8,
  );
// bodyMedium
  static TextStyle? bodyMedium = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 3.5,
  );
// bodySmall
  static TextStyle? bodySmall = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 3.2,
  );
// labelLarge
  static TextStyle? labelLarge = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 2.8,
  );
// labelMedium
  static TextStyle? labelMedium = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 2.5,
  );
// labelSmall
  static TextStyle? labelSmall = GoogleFonts.poppins(
    fontSize: AppSizeConfig.blockSizeHorizontal! * 2.2,
    letterSpacing: 1.65,
  );
}
