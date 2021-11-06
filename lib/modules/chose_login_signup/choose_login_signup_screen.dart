import 'package:bundle_app/modules/login/login_new.dart';
import 'package:bundle_app/modules/signup/new_signup_screen.dart';
import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseLoginSignup extends StatelessWidget {
  const ChooseLoginSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15,top:25.0),
            child: Icon(Icons.brightness_4_outlined,size: 30,),
          ),
          Image(
            width: 410.0,
            height: 280.0,
            alignment: Alignment.topLeft,
            image: Svg('assets/Photos/Moment to remember-rafiki.svg'),
            fit: BoxFit.fill,
          ),
          SizedBox(height: 32.0,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Welcome to ',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'SegoeUI-Semibold',
                //fontWeight: FontWeight.w600,
                color: HexColor('#2E3645'),
              ),
            ),
          ),
          SizedBox(
            height: 13.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Bundle ',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'ScriptMTBold',
                fontWeight: FontWeight.bold,
                color: HexColor('#2E3645'),
              ),
            ),
          ),
          SizedBox(height: 36.0,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              'Fast , Safe and fun moment sharing',textAlign: TextAlign.start,
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                //fontWeight: FontWeight.bold,
                color: HexColor('#2E3645'),
                fontFamily: 'SegoeUI-Semibold',
              ),
            ),
          ),
          SizedBox(height: 25.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child:defaultMaterialButton(
                      defaultMaterialButtonLabel: 'Create account',
                      defaultMaterialButtonPressed: (){
                        navigateTo(context, NewSignUpScreen());
                      }
                  ),
                ),
                SizedBox(width: 9.0,),
                Expanded(
                  child:  defaultMaterialButton(
                      defaultMaterialButtonLabel: 'Login',
                      defaultMaterialBorderColor: '#FFFFFF',
                      defaultMaterialButtonColor: '#9676FF',
                      defaultMaterialButtonPressed: (){
                        navigateTo(context, NewLoginScreen());
                      }
                  ),
                ),
              ],
            ),
          )
          //SizedBox(height: 160.0,),
        ],
      ),
    );
  }
}

