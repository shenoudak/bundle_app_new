import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Permissions',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'SegoeUI-Bold',
            fontWeight: FontWeight.bold,
            color: HexColor('#2E3645'),
          ),
        ),
        leading: IconButton(

          icon: Image(
            image: Svg('assets/icons/back-arrow.svg'),
            width: 16.0,
            height: 16.0,
            color: HexColor('#2E3645'),
          ), onPressed: () {
          Navigator.pop(context);
        },
        ),
        actions: [
          defaultTextButton(
            defaultTextButtonPressed: (){},
            defaultTextButton: 'Skip'

          ),
        ],

      ),
      body: ListView(

        children: [
          Image(
            //alignment: Alignment.topLeft,
            width: 360.0,height: 280.0,
             fit: BoxFit.fitWidth,
            image: Svg('assets/Photos/Private data-rafiki (1).svg'), //fit: BoxFit.cover,
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'Please allow us to access ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'SegoeUI-Semibold',
                fontWeight: FontWeight.bold,
                color: HexColor('#2E3645'),
              ),
            ),
          ), ),
          Expanded(child: Text(
            'these services for Bundle use ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'SegoeUI-Semibold',
              fontWeight: FontWeight.bold,
              color: HexColor('#2E3645'),
            ),
          ),),
          SizedBox(height: 60.0,),
          Expanded(
            flex: 3,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: defaultMaterialButton(
                defaultMaterialButtonLabel: 'Permissions',
                defaultMaterialButtonPressed: (){}
            ),
          ),),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 3,
            child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: defaultMaterialButton(
                defaultMaterialButtonLabel: 'Skip',
                defaultMaterialBorderColor: '#FFFFFF',
                defaultMaterialButtonColor: '#9676FF',
                defaultMaterialButtonPressed: (){}
            ),),
          ),
          SizedBox(height: 30.0,),

        ],
      ),
    );
  }
}
