import 'package:delivery_food_app/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class StartUpViewScreen extends StatefulWidget {
  const StartUpViewScreen({super.key});

  @override
  State<StartUpViewScreen> createState() => _StartUpViewStateState();
}

class _StartUpViewStateState extends State<StartUpViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goWelcomeScreen();
  }

  void goWelcomeScreen() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500), // ⏳ smooth duration
        pageBuilder: (context, animation, secondaryAnimation) => const WelcomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/image/splash_bg.png'),
          Image.asset(
            'assets/image/app_logo.png',
            width: media.width * 0.6,
            height: media.height * 0.45,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}