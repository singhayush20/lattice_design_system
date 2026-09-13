import 'package:flutter/material.dart';
import 'package:ds_core/ds_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = DsColorScheme.light();
    final darkTheme = DsColorScheme.dark();
    
    return MaterialApp(
      title: 'Lattice Design System',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: lightTheme.textLink,
          onPrimary: lightTheme.buttonPrimaryText,
          secondary: lightTheme.secondary,
          onSecondary: lightTheme.onSecondary,
          error: lightTheme.error,
          onError: lightTheme.textError,
          surface: lightTheme.backgroundSurface,
          onSurface: lightTheme.textPrimary,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          primary: darkTheme.textLink,
          onPrimary: darkTheme.buttonPrimaryText,
          secondary: darkTheme.secondary,
          onSecondary: darkTheme.onSecondary,
          error: darkTheme.error,
          onError: darkTheme.textError,
          surface: darkTheme.backgroundSurface,
          onSurface: darkTheme.textPrimary,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lattice Design System')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Design System Showcase',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            const Text('Color system is working!'),
          ],
        ),
      ),
    );
  }
}
