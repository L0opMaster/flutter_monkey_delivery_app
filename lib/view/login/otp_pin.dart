import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/view/login/login_view.dart';
import 'package:delivery_food_app/view/login/new_password.dart';
import 'package:delivery_food_app/view/login/reset_password.dart';
import 'package:delivery_food_app/view/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPpinCode extends StatelessWidget {
  final bool isReturningToWelcome;
  const OTPpinCode({super.key, this.isReturningToWelcome = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 35),
          onPressed: () {
            /// Example logic:
            /// If user came from Welcome page, go back to Welcome.
            /// Otherwise go to Reset Password.
            ///
            /// Replace this with your actual condition (e.g., check a flag or passed argument).
            if (isReturningToWelcome) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
                (route) => false,
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ResetPassword()),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Text(
                  'We have sent an OTP to your Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: TColor.primaryText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please check your mobile number 016 *** *65 to continue resetting your password',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.secondarytext,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    // Optional: handle validation or checks here
                  },
                  onSubmit: (String verificationCode) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
                RoundButton(
                  title: 'Send',
                  onPressed: () {
                    if (isReturningToWelcome) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnBoardingView())
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewPassword(isReturning: false),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
