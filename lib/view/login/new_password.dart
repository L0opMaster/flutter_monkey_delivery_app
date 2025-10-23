import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/login/login_view.dart';
import 'package:delivery_food_app/view/login/otp_pin.dart';
// import 'package:delivery_food_app/view/login/reset_password.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  final bool isReturning;
  const NewPassword({super.key, this.isReturning = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          if (isReturning) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
                (route) => false,
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const OTPpinCode()),
              );
            }
        }, icon: Icon(Icons.chevron_left, size: 35,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            children: [
                Text('New Password', 
                style: TextStyle(
                      fontSize: 30,
                      color: TColor.primaryText,
                      fontWeight: FontWeight.w800
                ),),
                SizedBox(height: 10,),
                Text(
                  'Please enter your email to receive a link to create a new password vai email.',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.secondarytext,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                RoundTextfield(hintText: 'New Password', obscureText: true, alignment: TextAlign.start,),
                SizedBox(height: 20),
                RoundTextfield(hintText: 'Comfirm Password', obscureText: true, alignment: TextAlign.start,),
                SizedBox(height: 30),
                RoundButton(title: 'Next', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}