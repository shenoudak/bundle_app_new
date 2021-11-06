import 'dart:math';

import 'package:bundle_app/modules/login/login_new.dart';
import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';

class KeyScreen extends StatelessWidget
{
  final String keyGenerated;

   KeyScreen( this.keyGenerated);

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Key',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'SegoeUI-Bold',
            fontWeight: FontWeight.bold,
            color: HexColor('#2E3645'),
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image(
                alignment: Alignment.topLeft,

               width: 440.0,height: 280.0,
                fit: BoxFit.fitWidth,
                image: Svg('assets/Photos/Key-pana.svg'), //fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Copy your key and save it  ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'SegoeUI-Semibold',
                  fontWeight: FontWeight.bold,
                  color: HexColor('#2E3645'),
                ),
              ),
            ),
           Text(
              '& dont\' share it with anyone ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'SegoeUI-Semibold',
                fontWeight: FontWeight.bold,
                color: HexColor('#2E3645'),
              ),
            ),
            SizedBox(height: 50.0,),
            GestureDetector(

              child: Container(
                width: double.infinity,
                  height: 32.0,
                  child: Text(keyGenerated,
                    textAlign: TextAlign.center,

                    style: TextStyle(
                       color: HexColor('#9676FF'),
                      fontFamily: 'SegoeUI-Semibold',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),),
              ),
            ),
            SizedBox(height: 50.0,),
            defaultMaterialButton(
              defaultMaterialButtonLabel: 'Copy & continue',
              defaultMaterialButtonPressed: ()
              {
                Clipboard.setData(ClipboardData(text: keyGenerated))
                    .then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Value is copied')));
                  navigateTo(context, NewLoginScreen());
                }//only if ->

                  //navigateTo(context, NewSignUpScreen());
                );
              },

            ),

            //SizedBox(height: 160.0,),
          ],
        ),
      ),
    );
  }

}
