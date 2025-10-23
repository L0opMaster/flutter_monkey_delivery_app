import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_tab_botton.dart';
import 'package:delivery_food_app/view/home/home.dart';
import 'package:flutter/material.dart';

class MainTapbar extends StatefulWidget {
  const MainTapbar({super.key});

  @override
  State<MainTapbar> createState() => _MainTapbarState();
}

class _MainTapbarState extends State<MainTapbar> {
  int slctTab = 2;
  Widget slctTabview = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed:(){
            
            if (slctTab !=2) {
              slctTab = 2;
              slctTabview = const Home();
            }
            if(mounted){
              setState(() {
                
              });
            }
          },
          
          shape: CircleBorder(),
          backgroundColor: slctTab == 2 ? TColor.primary : TColor.placeholder,
          child: Image.asset(
            'assets/image/tab_home.png',
            width: slctTab == 2 ? 30 : 25,
            height: slctTab == 2 ? 30 : 25,
            fit: BoxFit.cover,
          ), 
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 0,
        height: 80,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RoundTabBotton(
              title: 'Home', 
              icon: 'assets/image/tab_menu.png', 
              isSlct: slctTab == 0, 
              onTap: (){
                if (slctTab != 0) {
                  slctTab = 0;
                  slctTabview = Container();
                }
                if (mounted) {
                  setState(() {
                    
                  });
                }
              }  
            ),
            RoundTabBotton(
              title: 'Home', 
              icon: 'assets/image/tab_offer.png', 
              isSlct: slctTab == 1, 
              onTap: (){
                if (slctTab != 1) {
                  slctTab = 1;
                  slctTabview = Container();
                }
                if (mounted) {
                  setState(() {
                    
                  });
                }
              }  
            ),
            SizedBox(width: 50),
            RoundTabBotton(
              title: 'Home', 
              icon: 'assets/image/tab_more.png', 
              isSlct: slctTab == 3, 
              onTap: (){
                if (slctTab != 3) {
                  slctTab = 3;
                  slctTabview = Container();
                }
                if (mounted) {
                  setState(() {
                    
                  });
                }
              }  
            ),
            RoundTabBotton(
              title: 'Home', 
              icon: 'assets/image/tab_profile.png', 
              isSlct: slctTab == 4, 
              onTap: (){
                if (slctTab != 4) {
                  slctTab = 4;
                  slctTabview = Container();
                }
                if (mounted) {
                  setState(() {
                    
                  });
                }
              }  
            ),
          ],
        ),
      )
    );
  }
}