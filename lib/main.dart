import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ConfigesApp());
}

class ConfigesApp extends StatelessWidget {
  const ConfigesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CONFIGES ABDELLALI PRO',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,

      themeMode: ThemeMode.system,

      home: const HomeScreen(),
    );
  }
}
