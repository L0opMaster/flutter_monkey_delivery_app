import 'package:delivery_food_app/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetialOffer extends StatefulWidget {
  final Map<String, dynamic> detialitem;
  const DetialOffer({super.key, required this.detialitem,});

  @override
  State<DetialOffer> createState() => _ItemsDetialState();
}

class _ItemsDetialState extends State<DetialOffer> {
  String? selectedSize;
  String? selectedIngre;
  int qty = 0;
  // final List<Map<String, String>> popuArry = [
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: TColor.primary,
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            widget.detialitem["image"].toString(),
            width: media.width,
            height: media.height * 0.33,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.height * 0.33,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x57000000), 
                  Colors.transparent,
                  Color(0x57000000) 
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  SizedBox(height: media.width - 190),
                  Container(
                    width: media.width,
                    height: media.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)
                      ),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black54
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 35),
                              Text(
                                widget.detialitem["name"].toString(),
                                style: TextStyle(
                                  fontSize: media.width * 0.06,
                                  fontWeight: FontWeight.w800
                                ),
                              ),
                              SizedBox(height: 2),
                              _ratingStar(),
                              Text('Description', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                              Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  'Our French Apple Pie features tender, caramelized apples layered over a buttery, flaky pastry crust, lightly spiced with cinnamon and nutmeg.',
                                  textAlign: TextAlign.justify,
                                ), 
                              ),
                              Divider(height: 1,),
                              SizedBox(height: 20),
                              Text(
                                'Customize your Order',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey.shade400),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedSize,
                                    items: ["Small", "Big"].map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey
                                            ),
                                          )
                                        );
                                      }
                                    ).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSize = value!;
                                      });
                                    },
                                    hint: Text('- Select the Size of portion'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey.shade400),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: selectedIngre,
                                    items: ["Small", "Big"].map(
                                      (e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey
                                            ),
                                          )
                                        );
                                      }
                                    ).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedIngre = value!;
                                      });
                                    },
                                    hint: Text('- Select the Ingredients'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Number of Portions',style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed:() {
                                          qty = qty-1;
                                          if(qty < 0){
                                            qty = 0;
                                          }
                                          setState(() {
                                            
                                          });
                                        } , 
                                        icon: Icon(
                                          Icons.remove_circle,
                                          size: 40,
                                          color: TColor.primary,
                                        )
                                      ),
                                      Container(
                                        width: 100,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: TColor.primary, width: 2),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: Text(
                                          qty.toString()
                                        ),
                                      ),
                                      IconButton(
                                        onPressed:() {
                                          qty = qty+1;
                                          setState(() {
                                            
                                          });
                                        } , 
                                        icon: Icon(
                                          Icons.add_circle,
                                          size: 40,
                                          color: TColor.primary,
                                        )
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            // SizedBox(height: media.width * 0.2,),
                            Row(
                              children: [
                                Container(
                                  width: media.width * 0.3,
                                  height: media.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: TColor.primary,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(60),
                                      bottomRight: Radius.circular(60)
                                    )
                                  ),
                                ),
                                
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 20, right: 50),
                              width: media.width - 100,
                              height: media.width * 0.35,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 7,
                                      offset: Offset(0, 4))
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Total Price',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                                  // SizedBox(height: 5),
                                  Text(
                                  '\$ ${(qty * (double.tryParse(widget.detialitem["price"] ?? "0") ?? 0)).toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                                  // SizedBox(height: 5),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      
                                    }, 
                                    icon: Image.asset('assets/image/shopping_add.png'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: TColor.primary
                                    ),
                                    label: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, bottom: 20, right: 20),
                              width: 60,
                              height:60,
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.only(
                                //     topLeft: Radius.circular(50),
                                //     bottomLeft: Radius.circular(50),
                                //     topRight: Radius.circular(15),
                                //     bottomRight: Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x00000000).withOpacity(0.53),
                                    offset: Offset(0, 0),
                                    blurRadius: 8,
                                    spreadRadius: -3,
                                  ),
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/image/shopping_cart.png',
                                    color: TColor.primary,
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            )
                            // Row(
                            //   children: [
                            //     Container(
                            //       width: media.width * 0.3,
                            //       height: media.width * 0.5,
                            //       decoration: BoxDecoration(
                            //         color: TColor.primary,
                            //         borderRadius: BorderRadius.only(
                            //           topRight: Radius.circular(60),
                            //           bottomRight: Radius.circular(60)
                            //         )
                            //       ),
                            //     ),
                                
                            //   ],
                            // )
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Row _ratingStar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBar.builder(
              initialRating: double.tryParse(widget.detialitem["rate"] ?? "0") ?? 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 27,
              ignoreGestures: true,
              itemPadding: EdgeInsets.only(right: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: TColor.primary,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 3),
              child: Text(
                '${widget.detialitem["rate"]} Star Ratings',
                // '${rating}',
                style: TextStyle(
                  fontSize: 12,
                  color: TColor.primary,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
        _price()
      ],
    );
  }

  Column _price() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$ ${double.tryParse(widget.detialitem["price"] ?? "0") ?? 0}',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700
          ),
        ),
        Text(
          '/ per Portion',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}