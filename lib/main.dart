import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/meditation/presentation/screens/meditation_screen.dart';

void main() {
  runApp(const MeditationApp());
}

class MeditationApp extends StatelessWidget {
  const MeditationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          background: Colors.white,
          primary: Colors.orange,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const MeditationScreen(),
    );
  }
}
