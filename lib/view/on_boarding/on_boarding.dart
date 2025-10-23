import 'package:delivery_food_app/common/color_extension.dart';
import 'package:delivery_food_app/common_widgets/round_button.dart';
import 'package:delivery_food_app/view/main_tapview/main_tapbar_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  int selected_page = 0;
  final List<Map<String, String>> pageArr = [
    {
      "title" : "Find food you love",
      "subtitle" : "Discover the best foods over 1,000 restaurants and fast delivery to your doorstep",
      "image" : "assets/image/on_boarding_1.png"
    },
    {
      "title" : "Fast Delivery",
      "subtitle" : "Fast food delivery to your home. office wherever you are",
      "image" : "assets/image/on_boarding_2.png"
    },
    {
      "title" : "Live Tracking",
      "subtitle" : "Real time tracking of your food on the app once you placed the order",
      "image" : "assets/image/on_boarding_3.png"
    },
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pageArr.length,
            onPageChanged: (index) {
              setState(() {
                selected_page = index;
              });
            },
            itemBuilder: (context, index) {
              var objItem = pageArr[index];
              return Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: media.height * 0.1),
                  Image.asset(
                    objItem["image"].toString(),
                    width: media.width * 0.7,
                    height: media.height * 0.48,
                    // fit: BoxFit.cover,
                    // fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: media.height * 0.02), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pageArr.length, 
                      (index) => Container(
                        height: selected_page == index ? 15 : 10,
                        width: selected_page == index ? 15 : 10,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected_page == index ? TColor.primary : TColor.secondarytext
                        ),
                      )
                    )
                  ),
                  SizedBox(height: media.height * 0.02),
                  Text(
                    objItem["title"].toString(),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  SizedBox(height: media.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      objItem["subtitle"].toString(),
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              );
            },              
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: RoundButton(
                  title: selected_page == pageArr.length -1 ? 'Get Start' : 'Next',
                  height: 70, 
                  onPressed: () {
                    if (selected_page == pageArr.length - 1) {
                      // If we're on the last page, navigate to MainTapbarView
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainTapbar()),
                      );
                      print('next');
                    } else {
                    // Otherwise, go to the next onboarding page
                      _controller.animateToPage(
                        selected_page + 1,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                      );
                    }
                  }
                ),
              ),
              SizedBox(height: media.height * 0.1,)
            ],
          ),
        ],
      )
    );
  }
}