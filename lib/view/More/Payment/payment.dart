import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/view/More/Payment/addcart.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Detials',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset('assets/image/shopping_cart.png',
                width: 25,
                height: 25,),
            )
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customize your payment method',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20),
                Divider(height: 1,)
              ],
            ),
          ),
          SizedBox(height: 20),
          Card(
            // color:  const Color(0xFFF7F5F5),
            clipBehavior: Clip.none,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F5F5),
                boxShadow: [
                  
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.26),
                    offset: Offset(-5, 13),
                    blurRadius: 32,
                    spreadRadius: 0,
                  ),
                  
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cash/Card on delivery',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                        Image.asset(
                          'assets/image/check.png',
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(height: 1,),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text('Cash/Card on delivery'),
                        Image.asset(
                          'assets/image/visa_icon.png',
                          width: 60,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                
                        Text(
                          '1234567890123'
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5F5F5),
                            side: BorderSide(
                              color: TColor.primary,
                              width: 2
                            ),
                            
                          ),
                          onPressed: (){}, 
                          child: Text(
                            'Delete Card',
                            style: TextStyle(
                              fontSize: 13,
                              color: TColor.primary
                            ),
                          )
                        )
                      ]
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1,),
                    SizedBox(height: 20),
                    Text(
                      'Other Methods',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                  
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: TColor.primary,
                side: BorderSide(
                  color: TColor.primary,
                  width: 2
                ),
                
              ),
              onPressed: (){
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => const AddCard(),
                  );
              }, 
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  '+ Add Another Credit/Debit Card',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color(0xFFFFFFFF)
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}