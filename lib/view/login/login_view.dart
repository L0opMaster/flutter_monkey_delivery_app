import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/common_widgets/round_button_icon.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/login/create_account.dart';
import 'package:delivery_food_app/view/login/otp_pin.dart';
import 'package:delivery_food_app/view/login/reset_password.dart';
import 'package:delivery_food_app/view/login/welcome_view.dart';

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // TextEditingController textEmail = TextEditingController();
  // TextEditingController textPasswors = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 35),
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Add your detial to login',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.secondarytext,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 30),
                _fieldEmail(),
                SizedBox(height: 20),
                _FieldPassword(),
                SizedBox(height: 30),

                // Login button

                _LoginButton(),
                SizedBox(height: 10),
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                  }, 
                  child: Text(
                    'Forget the password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: TColor.secondarytext,
                    ),
                  )
                ),
                SizedBox(height: 30),
                Text(
                  'or Login With',
                  style: TextStyle(
                    fontSize: 14,
                    color: TColor.secondarytext,
                  ),
                ),
                SizedBox(height: 35),
                RoundButtonIcon(
                  colortype: RoundBackgroundType.backgroundColor,
                  title: 'Login with Facebook', 
                  onPressed: (){

                  },
                  icon: Image.asset('assets/image/facebook_logo.png', width: 20, height: 20,),
                ),
                SizedBox(height: 20),
                RoundButtonIcon(
                  title: 'Login with Facebook', 
                  onPressed: (){

                  },
                  icon: Image.asset('assets/image/google_logo.png', width: 20, height: 20,),
                  colortype: RoundBackgroundType.noneBackgroundColor,
                  
                ),
                SizedBox(height: 100),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 👈 centers the content
                    children: [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        ' Sign Up',
                        style: TextStyle(
                          color: TColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),  
              ],
            ),
          ),
        ),
      ),
    );
  }

  RoundTextfield _fieldEmail() {
    return RoundTextfield(
                hintText: 'Email', 
                obscureText: false,
                keybordTyoe: TextInputType.emailAddress,
              );
  }

  RoundTextfield _FieldPassword() {
    return RoundTextfield(
                hintText: 'Password', 
                obscureText: true,
                keybordTyoe: TextInputType.text,
              );
  }

  RoundButton _LoginButton() {
    return RoundButton(
                height: 65,
                title: 'Login', 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OTPpinCode(isReturningToWelcome: true,)));
                }
              );
  }
}