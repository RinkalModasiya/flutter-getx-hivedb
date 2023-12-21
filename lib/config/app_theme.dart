import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_constants.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.colorPrimary,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: AppConstants.poppins,
  textTheme: const TextTheme(
    labelSmall: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.colorSecondary),
    labelLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: AppColors.blackColor),
    bodyMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors.textColorContent),
    headlineSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor),
    headlineMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor),
    headlineLarge: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor),
  ),
);
