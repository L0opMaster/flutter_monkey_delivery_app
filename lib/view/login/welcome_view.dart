import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/view/login/create_account.dart';
import 'package:delivery_food_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/image/welcome_top_shape.png',
                  width: media.width * 1,
                ),
                Image.asset(
                  'assets/image/app_logo.png',
                  width: media.width * 0.5,
                  height: media.height * 0.22,
                )
              ],
            ),
            SizedBox(height: media.height * 0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Discover the best foods from over 1,0000 restaurants and fast delivery to your doorstep.',
                style: TextStyle(
                  fontSize: 18,
                  color: TColor.primaryText
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: media.height * 0.05,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                type: RoundButtonType.backgroundColor,
                title: 'Login', 
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()) 
                  );
                  print('Loin');
                }
              ), 
            ),
            SizedBox(height: media.height * 0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                type: RoundButtonType.textPrimary,
                title: 'Create new account', 
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => CreateAccount()));
                }
              ), 
            )
          ],
        ),
      ),
    );
  }
}