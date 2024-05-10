import 'package:e_labor/Search.dart';
import 'package:e_labor/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For system chrome changes (optional)

import 'home_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
  // Optional: Set preferred status bar styles (Android only)
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Adjust as needed
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name', // Replace with your app title
      theme: ThemeData(
        // Your app's theme customizations
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Define named routes for navigation
      initialRoute: '/home', // Set the initial route (usually login)
      routes: {
        '/': (context) => const Login(), // Login screen
        '/register': (context) => const Registration(), // Registration screen
        '/home': (context) => const Home(),
        '/search': (context) => const Search(),
      },
    );
  }
}