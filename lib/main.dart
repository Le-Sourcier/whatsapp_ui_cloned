// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/Screen/CameraScreen.dart';
import 'package:whatsapp_clone/Screen/HomeScreen.dart';
import 'package:whatsapp_clone/Screen/static/color.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras().timeout(Duration(seconds: 2));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: KprimaryColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
