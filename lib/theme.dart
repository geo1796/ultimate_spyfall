import 'package:flutter/material.dart';

const primaryColor = Colors.white;
const secondaryColor = Colors.black;

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
  ),
  appBarTheme:
      const AppBarTheme(color: secondaryColor, foregroundColor: primaryColor),
  switchTheme: SwitchThemeData(
    thumbColor: const WidgetStatePropertyAll(primaryColor),
    trackColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return secondaryColor;
      }
      return secondaryColor.withOpacity(0.5);
    }),
    trackOutlineColor: const WidgetStatePropertyAll(secondaryColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: primaryColor,
    backgroundColor: secondaryColor,
  ),
  textButtonTheme: const TextButtonThemeData(
      style:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(secondaryColor))),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(secondaryColor),
          foregroundColor: WidgetStatePropertyAll(primaryColor))),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: secondaryColor,
    primary: secondaryColor,
  ),
  appBarTheme:
      const AppBarTheme(color: primaryColor, foregroundColor: secondaryColor),
  switchTheme: SwitchThemeData(
    thumbColor: const WidgetStatePropertyAll(secondaryColor),
    trackColor:
        WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return primaryColor;
      }
      return primaryColor.withOpacity(0.5);
    }),
    trackOutlineColor: const WidgetStatePropertyAll(primaryColor),
  ),
  listTileTheme: const ListTileThemeData(
    textColor: primaryColor,
    iconColor: primaryColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: secondaryColor,
    backgroundColor: primaryColor,
  ),
  textButtonTheme: const TextButtonThemeData(
      style:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(primaryColor))),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primaryColor),
          foregroundColor: WidgetStatePropertyAll(secondaryColor))),
);
