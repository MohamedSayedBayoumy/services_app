import 'package:flutter/material.dart';
import 'common/services/services_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/bottom_navgation_screen/bottom_navgation_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    Hive.initFlutter(),
  ]);

  ServicesLocator.service();
  // runApp(
  //   DevicePreview(
  //     builder: (context) => const MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Services App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffffffff)),
        // useMaterial3: true,
      ),
      home: const BottomNavigationBarScreens(),
    );
  }
}
