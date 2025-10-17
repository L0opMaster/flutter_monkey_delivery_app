import 'package:delivery_food_app/view/login/welcome_view.dart';
import 'package:flutter/material.dart';

class StartUpViewState extends StatefulWidget {
  const StartUpViewState({super.key});

  @override
  State<StartUpViewState> createState() => _StartUpViewStateState();
}

class _StartUpViewStateState extends State<StartUpViewState> {
  @override
  void initState() {
    super.initState();
    goWelcomeScreen();
  }

  void goWelcomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeView() 
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/image/splash_bg.png', 
            width: media.width, 
            height: media.height, 
            fit: BoxFit.cover
          ),
          Image.asset(
            'assets/image/app_logo.png', 
            width: media.width * 0.5, 
            height: media.height * 0.5, 
            fit: BoxFit.contain
          )
        ] 
      ),
    );
  }
}