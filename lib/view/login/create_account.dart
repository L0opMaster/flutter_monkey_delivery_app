import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/login/login_view.dart';
import 'package:delivery_food_app/view/login/welcome_view.dart';

import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> {
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30,
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w800
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Add your detail to sign up',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.secondarytext,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 30),
                _fieldName(),
                SizedBox(height: 20),
                _fieldEmail(),
                SizedBox(height: 20),
                _fieldMobilePhone(),
                SizedBox(height: 20),
                _fieldPassword(),
                SizedBox(height: 20),
                _fieldAddress(),
                SizedBox(height: 20),
                _fieldPassword(),
                SizedBox(height: 20),
                _fieldComfirmPassword(),
                SizedBox(height: 30),

                // Sign up button
                _signUp(),
                // _loginButton(),
                SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 👈 centers the content
                    children: [
                      Text(
                        "Don't have an Account? ",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Login',
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

  RoundTextfield _fieldName() {
    return RoundTextfield(
      hintText: 'Name', 
      obscureText: false,
      keybordTyoe: TextInputType.text,
    );
  }

  RoundTextfield _fieldEmail() {
    return RoundTextfield(
      hintText: 'Email', 
      obscureText: true,
      keybordTyoe: TextInputType.emailAddress,
    );
  }
  RoundTextfield _fieldMobilePhone() {
    return RoundTextfield(
      hintText: 'Mobile Phone', 
      obscureText: true,
      keybordTyoe: TextInputType.number,
    );
  }
  RoundTextfield _fieldAddress() {
    return RoundTextfield(
      hintText: 'Address', 
      obscureText: true,
      keybordTyoe: TextInputType.text,
    );
  }
  RoundTextfield _fieldPassword() {
    return RoundTextfield(
      hintText: 'Password', 
      obscureText: true,
      keybordTyoe: TextInputType.text,
    );
  }
  RoundTextfield _fieldComfirmPassword() {
    return RoundTextfield(
      hintText: 'Confirm Password', 
      obscureText: true,
      keybordTyoe: TextInputType.text,
    );
  }

  RoundButton _signUp() {
    return RoundButton(
      height: 65,
      title: 'Sign Up', 
      onPressed: (){}
    );
  }
}