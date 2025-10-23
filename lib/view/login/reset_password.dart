import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:delivery_food_app/view/login/login_view.dart';
import 'package:delivery_food_app/view/login/otp_pin.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
          }, 
          icon: Icon(Icons.chevron_left, size: 35,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Reset Password', 
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
                SizedBox(height: 30),
                RoundTextfield(
                  hintText: 'Email', 
                  obscureText: false,
                  keybordTyoe: TextInputType.emailAddress,
                ),
                SizedBox(height: 30),
                RoundButton(title: 'Send', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OTPpinCode()));})
              ],
            ),
          ),
        ),
      ),
    );
  }
}