import 'package:bundle_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';
Widget defaultTextButton(
{
  @required String? defaultTextButton,
  @required VoidCallback? defaultTextButtonPressed,
})=>TextButton(
  onPressed: defaultTextButtonPressed,
  child: Text(
    '$defaultTextButton',
    style: TextStyle(
      color: HexColor('#9676FF'),
      fontFamily: 'SegoeUI-Semibold',
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
Widget defaultFormFailed({
  @required TextEditingController? controller,
  @required String? label,
  Widget? defaultPrefixIcon,
  Widget? defaultSuffixIcon,
  TextInputType? keyboardType,
  bool isPassword = false,
  @required String?validatorReturnValue,
  VoidCallback? suffixIconPressed,
  double paddingSymmetricValue=20.0,
  double formFieldHeight=45.0,
  Function(String)? onChanged,
  int?maxLengthOfText,

}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: TextFormField(
        obscuringCharacter:'*' ,
        enableSuggestions: false,
        onChanged: onChanged,
        maxLength: maxLengthOfText,
        keyboardType:keyboardType ,
        controller: controller,
        obscureText: isPassword,
        validator: (value){
          if(value==null||value.isEmpty) {
            return validatorReturnValue;
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 16.0,fontFamily: 'SegoeUI-Semibold',fontWeight: FontWeight.bold,color: HexColor('#A0A0A0')),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintText: '$label',
          prefixIcon: defaultPrefixIcon,
          suffixIcon: defaultSuffixIcon != null
              ? IconButton(
                  icon: defaultSuffixIcon,
                  onPressed: suffixIconPressed,
                )
              : null,
        ),
        style: TextStyle(fontSize: 16.0,fontFamily: 'SegoeUI-Semibold',fontWeight: FontWeight.bold,color: HexColor('#2E3645')),
      ),
    );

 Widget defaultMaterialButton({
  double defaultMaterialButtonHeight = 50.0,
  double defaultMaterialButtonWidth = double.infinity,
  VoidCallback? defaultMaterialButtonPressed,
  String defaultMaterialBorderColor='#9676FF',
  String defaultMaterialButtonColor='#FFFFFF',
   String? defaultMaterialButtonLabel,
})=>Container(
   height: defaultMaterialButtonHeight,
   width: defaultMaterialButtonWidth,
   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(25.0),
     border: Border.all(
         color:primaryColor,

     ),
     color:HexColor('$defaultMaterialBorderColor'),

   ),
   child: MaterialButton(

     onPressed: defaultMaterialButtonPressed,
     child:  Text(
       '$defaultMaterialButtonLabel',
       style: TextStyle(
           color: HexColor('$defaultMaterialButtonColor'),
           fontSize: 15.0,
           fontWeight: FontWeight.bold,
           fontFamily: 'SegoeUI-Semibold'),
       //textAlign: TextAlign.center,
     ),
   ),
 );
//void navigateTo(context,widgetPage)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widgetPage));
navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
void navigateAndFinish(context,widgetPage)=>Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>widgetPage) , (route) => false);
Widget ifStateIsLoading(){
  return Center(child: CircularProgressIndicator());
}
////////////////////flutter toast////////////////
defaultSnakBar(String txt,context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(txt),
    backgroundColor: HexColor('#9676FF'),
    duration: Duration(
      seconds: 2,
    ),
  ));
}
Widget defaultPrefixIconWidget(String imageUrl){
  return Image(
    image: Svg(imageUrl),
    //fit: BoxFit.fill,
    color: Colors.grey[700],
    width: 22.0,
    height: 22.0,
  );

}



