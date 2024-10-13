import 'package:e_labor/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For system chrome changes (optional)
import 'package:get/get_navigation/src/root/get_material_app.dart';

// Import your screen files here
import 'home/views/home_screen.dart';
import 'chat_screen.dart';
import 'notification_screen.dart' as custom_notification;
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
  // Optional: Set preferred status bar styles (Android only)
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Adjust as needed
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Name', // Replace with your app title
      theme: ThemeData(
        // Your app's theme customizations
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.AUTHENTICATION,
      getPages: AppRoutes.routes,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    HomeScreen(),
    ChatScreen(),
    custom_notification.NotificationScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xfff67322),
        unselectedItemColor: Colors.grey.withOpacity(0.9),
        onTap: _onItemTapped,
      ),
    );
  }
}
