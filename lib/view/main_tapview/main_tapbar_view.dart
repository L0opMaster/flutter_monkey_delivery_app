import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_tab_botton.dart';
import 'package:delivery_food_app/view/Menu/menu.dart';
import 'package:delivery_food_app/view/More/more.dart';
import 'package:delivery_food_app/view/Profile/profile.dart';
import 'package:delivery_food_app/view/home/home.dart';
import 'package:delivery_food_app/view/offer/offer.dart';
import 'package:flutter/material.dart';

class MainTapbarView extends StatefulWidget {
  const MainTapbarView({super.key});

  @override
  State<MainTapbarView> createState() => _MainTapbarViewState();
}

class _MainTapbarViewState extends State<MainTapbarView> {
  int selected = 0;
  Widget selected_page = HomeView();
  PageStorageBucket storageBucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selected_page),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: (){
            if (selected != 0) {
              selected = 0;
              selected_page = const HomeView();
            }
            if (mounted) {
              setState(() {
                
              });
            }
          },
          shape: CircleBorder(),
          highlightElevation: 0,
          elevation: 0,
          backgroundColor:selected == 0 ? TColor.primary : Colors.white,
          child: Image.asset(
            'assets/image/tab_home.png',
            width: 30,
            height: 30,
            color: selected == 0 ? Colors.white : Colors.blueGrey,
          ), 
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: const Color(0xFF000000),
        elevation: 2,
        notchMargin: 10,
        padding: EdgeInsets.symmetric(horizontal: 25 ,vertical: 15),
        shape: CircularNotchedRectangle(),
        color: const Color(0xFFFFFFFF),
        surfaceTintColor: Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          // height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundManuTabButton(
                title: 'Menu',
                icon: 'assets/image/tab_menu.png', 
                isSelected: selected == 2, 
                onTab: (){
                  if (selected != 2) {
                    selected = 2;
                    selected_page = const MenuViwState();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }
              ),
              RoundManuTabButton(
                title: 'Offer',
                icon: 'assets/image/tab_offer.png', 
                isSelected: selected == 1, 
                onTab: (){
                  if (selected != 1) {
                    selected = 1;
                    selected_page = const OfferViewState();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }
              ),
              SizedBox(width: 20),
              RoundManuTabButton(
                title: 'More',
                icon: 'assets/image/tab_more.png', 
                isSelected: selected == 3, 
                onTab: (){
                  if (selected != 3) {
                    selected = 3;
                    selected_page = MoreState();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }
              ),
              RoundManuTabButton(
                title: 'Profile',
                icon: 'assets/image/tab_profile.png', 
                isSelected: selected == 4, 
                onTab: (){
                  if (selected != 4) {
                    selected = 4;
                    selected_page = const Profile();
                  }
                  if (mounted) {
                    setState(() {
                      
                    });
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}