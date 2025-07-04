import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/theme/app_theme.dart';
import 'screens/splash_screen.dart';
import 'providers/music_provider.dart';
import 'providers/audio_provider.dart'; // 🔁 Make sure you import this

void main() {
  runApp(const NoizioApp());
}

class NoizioApp extends StatelessWidget {
  const NoizioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()), // ✅ Added here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Noizio',
        theme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
