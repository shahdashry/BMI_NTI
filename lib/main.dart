import 'package:bmi/home_screen.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF8F9FA),
          elevation: 50,
          iconTheme: IconThemeData(color: Color(0xFF1C2135)),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1C2135),
          ),
          bodyMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C2135),
          ), // TextStyle
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1C2135),
          ),
          displayLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1C2135),
          ), // TextStyle
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFF1C2135),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1C2135),
          elevation: 50,
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFF),
          ),
          bodyMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFFFFFF),
          ), // TextStyle
          bodySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF),
          ),
          displayLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFFFFFFFF),
          ), // TextStyle
        ),
      ),
      themeMode: ThemeMode.dark,

      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ResultScreen.routeName: (context) => ResultScreen(),
      },
    );
  }
}