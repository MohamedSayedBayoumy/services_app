
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/services/services_locator.dart';
 import 'pages/bottom_navgation_screen/bottom_navgation_screen.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([]);
  await Hive.initFlutter();
  
  ServicesLocator.service();
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigationBarScreens(),
    );
  }
}
