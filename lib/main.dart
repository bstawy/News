import 'package:flutter/material.dart';
import 'package:news/core/theme/application_theme.dart';
import 'package:news/pages/home/home_view.dart';
import 'package:news/pages/settings/settings_view.dart';
import 'package:news/pages/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ApplicationTheme.light,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => HomeView(),
        SettingsView.routeName: (context) => const SettingsView(),
      },
    );
  }
}
