import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ui_samples/apps/fitness_magazine/pages/magazine_home_page.dart';
import 'package:flutter_ui_samples/apps/fitness_magazine/utils/theme.dart';

class FitnessApp extends StatefulWidget {
  const FitnessApp({super.key});

  @override
  State<FitnessApp> createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Magazines',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      supportedLocales: const [Locale('ar')],
      home: FitnessPage(
        isDarkMode: isDarkMode,
        switchTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}
