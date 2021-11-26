import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/FirstScreen.dart';
import 'package:projecte/Pantallas/HomeScreen.dart';
import 'package:projecte/Pantallas/LibraryScreen.dart';
import 'package:projecte/Pantallas/SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
