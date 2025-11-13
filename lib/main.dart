import 'package:delivery_food_app/view/login/welcome_view.dart';
import 'package:delivery_food_app/view/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Metropolis",
        // useMaterial3: true,
        useMaterial3: true
      ),
      // home: const StartUpViewScreen(),
      home: WelcomeScreen(),
    );
  }
}