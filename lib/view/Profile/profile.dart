import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/common_widgets/textprofile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: media.width * 0.06,
            fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/image/shopping_cart.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: Center(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                  ),
                  child: Image.asset('assets/image/cat_offer.png'),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: TColor.primary,
                        size: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 15, color: TColor.primary),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Hi there Luki Yara',
                  style: TextStyle(fontSize: 18, color: TColor.primaryText),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    
                  },
                  child: Text(
                    'Sign out',
                    style: TextStyle(fontSize: 15, color: TColor.primaryText),
                  )
                ),
                SizedBox(height: 40),
                Textprofile(
                  title: 'Name',
                  subtitle: 'Your name',
                  hidetext: true,
                ),
                SizedBox(height: 15),
                Textprofile(
                  title: 'Email',
                  subtitle: 'Your email',
                  hidetext: true,
                ),
                SizedBox(height: 15),
                Textprofile(
                  title: 'Phone',
                  subtitle: 'Your number',
                  hidetext: true,
                ),
                SizedBox(height: 15),
                Textprofile(
                  title: 'Address',
                  subtitle: 'Your address',
                  hidetext: true,
                ),
                SizedBox(height: 15),
                Textprofile(
                  title: 'Password',
                  subtitle: 'Your password',
                  hidetext: true,
                ),
                SizedBox(height: 15),
                Textprofile(
                  title: 'Confirm password',
                  subtitle: 'confirm',
                  hidetext: true,
                ),
                SizedBox(height: 25),
                RoundButton(title: 'Save', onPressed: () {
                  
                },
                
                ),
                
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}