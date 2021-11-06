import 'package:bundle_app/main.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreenView(
          backgroundColor: HexColor('#9676FF'),
            imageSize:130 ,
            imageSrc:'assets/images/logo.png',
            duration: 3000,
            navigateRoute: MyApp(),

        ),
      ),
    );

  }
}
