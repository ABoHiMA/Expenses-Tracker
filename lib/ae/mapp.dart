import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

const clrac = Colors.redAccent;
const clr = Colors.red;

const clracdrk = Colors.blueGrey;
const clrdrk = Colors.grey;

const drk = Color.fromARGB(255, 5, 99, 125);
const drkbr = Color.fromARGB(255, 3, 45, 56);

final aeclr = ColorScheme.fromSeed(
  seedColor: clr,
);

final aeclrdrk = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: drk,
);

// var thmlit = ThemeMode.light;
// var thmdrk = ThemeMode.dark;
// var thmstm = thmdrk;

class MApp extends StatelessWidget {
  const MApp({
    super.key,
    required this.hm,
  });
  final hm;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: drk,
        colorScheme: aeclrdrk,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: drkbr,
          foregroundColor: aeclrdrk.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: clracdrk,
          margin: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 6,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: aeclrdrk.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
              titleMedium: const TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: clr,
        colorScheme: aeclr,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: clrac,
          foregroundColor: Colors.black,
        ),
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 255, 149, 149),
          margin: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 6,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: aeclr.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
              titleMedium: const TextStyle(
                color: clr,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // themeMode: thmstm,
      home: hm,
    );
  }
}
