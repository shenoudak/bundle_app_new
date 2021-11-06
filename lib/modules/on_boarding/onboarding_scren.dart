import 'package:bundle_app/modules/chose_login_signup/choose_login_signup_screen.dart';
import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageViewController = PageController();
  bool arrivedToEnd = false;

  List<OnBoardingModel> model = [
    OnBoardingModel(
      imageUrl: 'assets/Photos/Sent Message-pana.svg',
      title: 'Media messages',
      body: 'Send and receiver photos and Videos with same quality',
    ),
    OnBoardingModel(
      imageUrl: 'assets/Photos/Journey-amico.svg',
      title: 'Explore Places',
      body:
          'Discover & Select amazing places and arrive safely to your destination is our first priority',
    ),
    OnBoardingModel(
      imageUrl: 'assets/Photos/Private data-amico.svg',
      title: 'Privacy Protection',
      body: 'All your data and messages are encrypted and safe',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageViewController,
                onPageChanged: (index) {
                  if (index == model.length - 1) {
                    setState(() {
                      arrivedToEnd = true;
                    });
                  } else {
                    setState(() {
                      arrivedToEnd = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildOnBoardingItem(model[index], index),
                itemCount: model.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: arrivedToEnd?SizedBox():Container(
                    height: 32.0,
                    width: 35.0,
                    child: TextButton(
                      onPressed: (){
                        navigateAndFinish(context,ChooseLoginSignup());
                      },
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'SegoeUI-Semibold',
                          color: HexColor('#2E3645'),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SmoothPageIndicator(
                      controller: pageViewController,
                      count: model.length,
                      effect: ExpandingDotsEffect(
                        dotColor: HexColor('#A0A0A0'),
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        spacing: 12.0,
                        activeDotColor: HexColor('#9676FF'),
                        expansionFactor: 4.0,
                      )),
                ),
                // Expanded(
                // child: FloatingActionButton(
                //   onPressed: () {
                //     if (arrivedToEnd == true) {
                //       // navigateTo(context, LoginScreen());
                //       navigateAndFinish(context, LoginScreen());
                //     } else {
                //       pageViewController.nextPage(
                //         duration: Duration(
                //           microseconds: 800,
                //         ),
                //         curve: Curves.fastLinearToSlowEaseIn,
                //       );
                //     }
                //   },
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (arrivedToEnd == true) {
                        navigateAndFinish(context,ChooseLoginSignup());
                      } else {
                        pageViewController.nextPage(
                          duration: Duration(
                            microseconds: 800,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: replaceWidget(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem(OnBoardingModel model, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 256.0,
          height: 272.0,
          image: Svg('${model.imageUrl}'),
          //fit: BoxFit.cover,
        ),
        SizedBox(
          height: 32.0,
        ),
        Text(
          '${model.title} ',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'SegoeUI-Semibold',
            fontWeight: FontWeight.bold,
            color: HexColor('#2E3645'),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          '${model.body}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: HexColor('#2E3645'),
            fontFamily: 'SegoeUI',
          ),
        ),
        //SizedBox(height: 160.0,),
      ],
    );
  }
  Widget replaceWidget(context)
  {
    if(arrivedToEnd==true){
      return Container(
        alignment: Alignment.center,
        height: 30.0,
          width: 35.0,
          child: Text('Done',textAlign: TextAlign.center,style: TextStyle(color: HexColor('#2E3645'),fontFamily: 'SegoeUI-Bold',fontSize: 15.0,fontWeight: FontWeight.bold,),));
    }
    else{
      return Container(
      height: 30.0,
      width: 35.0,
        child: Icon(
          Icons.arrow_forward, size: 18.0,
          //color: primaryColor,
        ),
      );

    }
  }
}

class OnBoardingModel {
  final String? imageUrl;
  final String? title;
  final String? body;
  OnBoardingModel(
      {@required this.imageUrl, @required this.title, @required this.body});
}
