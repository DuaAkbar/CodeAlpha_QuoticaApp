import 'package:flutter/material.dart';

final ThemeData mytheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,

    // Backgrounds and surfaces (light lilac)
    surface: Color(0xFFEED7F6),         // main background cards/surfaces
    surfaceTint: Color(0xFFEED7F6),     // subtle tint on elevated surfaces

    // Texts and buttons (dark purple)
    onSurface: Color(0xFF4A148C),       // text/icons on surface
    primary: Color(0xFF4A148C),         // main buttons or accents
    onPrimary: Colors.white,           // text/icon on buttons

    // Secondary (optional accent, similar to background)
   secondary: Color(0xFFDCB6F2),       // very light lavender accent
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    surfaceTintColor: Color(0xFF4A148C), // dark purple appbar tint
  ),
);
