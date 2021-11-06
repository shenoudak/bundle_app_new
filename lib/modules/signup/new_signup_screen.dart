import 'package:bundle_app/business_logic/cubit/cubit.dart';
import 'package:bundle_app/business_logic/cubit/states.dart';
import 'package:bundle_app/modules/login/login_new.dart';
import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';

import '../otp_page/otp_test.dart';

class NewSignUpScreen extends StatelessWidget
{
   NewSignUpScreen({Key? key}) : super(key: key);
  var nameController=TextEditingController();
  var userNameController=TextEditingController();
  var passCodeController=TextEditingController();
  var phoneNumberController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppState>(
      listener: (BuildContext context, state) {
        if(state is LoadingPhoneAuthState){

        }

      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              'Sign Up',
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
              Navigator.pop(context) ;
            },
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Image(
                    alignment: Alignment.topCenter,
                    height: 250.0,
                    width: 290,
                    image: Svg('assets/Photos/Trip-cuate.svg'),
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 18.0,),
                  Text(
                    'Create new account',
                    style: TextStyle(
                      color: HexColor('#2E3645'),
                      fontFamily: 'SegoeUI-Semibold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:30.0,),
                  defaultFormFailed(
                    controller: nameController,
                    label: 'Name',
                    defaultPrefixIcon: defaultPrefixIconWidget('assets/icons/name.svg'),
                    validatorReturnValue: 'Please enter your name',
                  ),
                  SizedBox(height: 17.0,),
                  defaultFormFailed(
                    controller: userNameController,
                    label: 'Username',
                    defaultPrefixIcon: defaultPrefixIconWidget('assets/icons/account.svg'),
                    validatorReturnValue: 'Please enter your Username',
                  ),
                  SizedBox(height: 17.0,),
                  defaultFormFailed(
                    controller: passCodeController,
                    label: 'Pass code (6-digits)',
                    maxLengthOfText:6,
                    validatorReturnValue: 'Please Enter your pass code',
                    defaultPrefixIcon: Icon(
                      Icons.lock,
                    ),
                  ),
                  SizedBox(height: 17.0,),
                  defaultFormFailed(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    label: 'Phone Number',
                    validatorReturnValue: 'Please Enter your Phone Number',
                    defaultPrefixIcon:Container(
                        padding: EdgeInsets.only(left: 5.0),
                        height: 22.0,
                        width: 130,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child:defaultPrefixIconWidget('assets/icons/contact_phone-24px.svg')),
                          Expanded(child: Icon(Icons.flag,size: 22,color: Colors.red,)),
                          Expanded(child: Text('+02',style: TextStyle(fontSize: 16.0,fontFamily: 'SegoeUI-Semibold',fontWeight: FontWeight.bold,),)),
                        ],
                      ),
                    ),
                    //defaultPrefixIconWidget('assets/icons/account.svg'),
                  ),
                  SizedBox(height: 45.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0,),
                    child:defaultMaterialButton(
                      defaultMaterialButtonPressed: (){
                       if(formKey.currentState!.validate()){
                         AppCubit.get(context).submitPhoneNumber(phoneNumberController.text);
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>
                             PinCodeTest(
                               nameController.text,
                               userNameController.text,
                               passCodeController.text+'@bundle.com',
                               phoneNumberController.text,
                               AppCubit.get(context).generateRandomPassword(),
                             )));
                       }
                       else{}
                        },
                      defaultMaterialButtonLabel: 'Continue',
                    )
                   /* Container(
                        width: double.infinity,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: HexColor('#9676FF'),
                        ),
                        child: MaterialButton(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontFamily: 'SegoeUI-Semibold'),
                              //textAlign: TextAlign.center,
                            ),
                            onPressed: () {

                              AppCubit.get(context).submitPhoneNumber(phoneNumberController.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  PinCodeTest(
                                      nameController.text,
                                      userNameController.text,
                                      passCodeController.text+'@bundle.com',
                                      phoneNumberController.text,
                                      AppCubit.get(context).generateRandomPassword(),
                                   )));

                            })),*/
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Have an account ?',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: HexColor('#2E3645'),
                          fontFamily: 'SegoeUI-Semibold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      defaultTextButton(
                        defaultTextButton: 'Login',
                        defaultTextButtonPressed: (){
                          navigateTo(context, NewLoginScreen());
                        }
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
