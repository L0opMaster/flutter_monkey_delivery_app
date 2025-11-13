import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button_icon.dart';
import 'package:delivery_food_app/common_widgets/round_textfield.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.clear, size: 20,)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Credit/Debit Card',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Divider(thickness: 2,),
                SizedBox(height: 10),
                RoundTextfield(
                  hintText: 'Card Number',
                  fontSize: 16, 
                  height: 60,
                  padding: EdgeInsets.only(left: 30),
                  alignment: TextAlign.start,
                  obscureText: false
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Explry',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: media.width*0.2),
                    RoundTextfield(
                      hintText: 'MM', 
                      obscureText: false,
                      height: 60,
                      padding: EdgeInsets.only(left: 40),
                      alignment: TextAlign.start,
                      width: media.width * 0.25),
                    Expanded(
                      child: SizedBox(
                        
                      ),
                    ),
                    RoundTextfield(
                      hintText: 'YY', 
                      height: 60,
                      padding: EdgeInsets.only(left: 40),
                      alignment: TextAlign.start,
                      obscureText: false,
                      width: media.width * 0.25,
                      )
                  ],
                ),
                SizedBox(height: 20),
                RoundTextfield(
                  hintText: 'Security Code', 
                  height: 60,
                  fontSize: 16,
                  padding: EdgeInsets.only(left: 40),
                  alignment: TextAlign.start,
                  obscureText: false,
                  // width: media.width * 0.25,
                  ),
                SizedBox(height: 20),
                RoundTextfield(
                  hintText: 'First name',
                  fontSize: 16, 
                  height: 60,
                  padding: EdgeInsets.only(left: 40),
                  alignment: TextAlign.start,
                  obscureText: false,
                  // width: media.width * 0.25,
                  ),
                SizedBox(height: 20),
                RoundTextfield(
                  hintText: 'Last name',
                  fontSize: 16, 
                  height: 60,
                  padding: EdgeInsets.only(left: 40),
                  alignment: TextAlign.start,
                  obscureText: false,
                  // width: media.width * 0.25,
                  ),
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(
                      width: media.width * 0.4,
                      child: Text(
                        'You can remove this card add anytime',
                        style: TextStyle(color: TColor.secondarytext, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: TColor.placeholder,
                            shape: BoxShape.circle
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          width: 40,
                          height: 15,
                          decoration: BoxDecoration(
                            color: TColor.placeholder,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                        ),

                      ],
                    )
                  ],
                
                ),
                SizedBox(height: 30),
                RoundButtonIcon(
                  colortype: RoundBackgroundType.noneBackgroundColor,
                  height: 55,
                  onPressed: (){

                  }, 
                  title: 'Add Card', icon: Image.asset('assets/image/add.png', width: 20, height: 20,))
              ],
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }
}
