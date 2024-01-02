import 'package:efood/auth/login.dart';
import 'package:efood/auth/sign_in.dart';
import 'package:efood/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBYJA80Ixa4S6jYB9mfsPEX-S0LOkePALg',
      appId: '1:267510667284:android:3bc35e9de4875022ff2f01',
      messagingSenderId: '267510667284',
      projectId: 'efood-a272a',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


