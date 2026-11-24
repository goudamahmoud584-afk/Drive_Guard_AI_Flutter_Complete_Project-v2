import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/onboarding_and_login_flow.dart';

void main() {
  runApp(const DriveGuardApp());
}

class DriveGuardApp extends StatelessWidget {
  const DriveGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drive Guard AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColorsDark.bgCanvas,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: AppColorsDark.accentDefault,
          secondary: AppColorsDark.safeDefault,
          surface: AppColorsDark.bgSurface,
          error: AppColorsDark.dangerDefault,
        ),
      ),
      home: const OnboardingFlowScreen(),
    );
  }
}
