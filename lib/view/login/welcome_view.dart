import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media  = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/image/welcome_top_shape.png',
                width: media.width ,
                // height: media.height * 0.7,
                // fit: BoxFit.cover,
              ),
              SizedBox(height: 40,),
              Image.asset(
                'assets/image/app_logo.png',
                width: media.width * 0.45 ,
                height: media.height * 0.29,
                fit: BoxFit.contain,
              )
            ],
          ),
          // SizedBox(height: media.height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: RoundButton(
              title: 'Login',
              onPressed: (){
            
              }
            ),
          ),
          SizedBox(height: media.height * 0.05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: RoundButton(
              onPressed: (){

              },  
              title: 'Create new account' ,
              type: RoundButtonType.textPrimary,
              
            ),

          )
        ],
      ),
    );
  }
}