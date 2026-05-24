import 'package:flutter/material.dart';
import 'package:nova_alarm/core/theme/app_theme.dart';
import 'package:nova_alarm/features/auth/splash_screen.dart';

class NovaAlarmApp extends StatelessWidget {
  const NovaAlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova Alarm',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
