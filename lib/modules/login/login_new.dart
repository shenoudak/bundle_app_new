import 'package:bundle_app/business_logic/cubit/cubit.dart';
import 'package:bundle_app/business_logic/cubit/states.dart';
import 'package:bundle_app/layout/mainscreen/main_screen.dart';
import 'package:bundle_app/modules/key_screen/key_screen.dart';
import 'package:bundle_app/modules/permission_screen/permission_screen.dart';
import 'package:bundle_app/modules/signup/new_signup_screen.dart';
import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';
class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({Key? key}) : super(key: key);

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  bool isSuffixIcon = false;
  var keyPasswordController = TextEditingController();
  var passCodeController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              'Login',
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
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      alignment: Alignment.topCenter,
                      height: 200,
                      width: 290,
                      image: Svg('assets/Photos/Curious-amico.svg'),
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 18.0,),
                    Text(
                      'Login to continue',
                      style: TextStyle(
                        color: HexColor('#2E3645'),
                        fontFamily: 'SegoeUI-Semibold',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 31.0,),
                    defaultFormFailed
                      (
                      controller: keyPasswordController,
                      label: 'Key',
                      defaultPrefixIcon: Icon(Icons.vpn_key_outlined),

                      validatorReturnValue: 'You must enter the key ',
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    defaultFormFailed(
                      onChanged: (String value) {
                        changeSuffixIconWhenChanged(value);
                      },
                      controller: passCodeController,
                      maxLengthOfText: 6,
                      defaultPrefixIcon: Icon(
                        Icons.lock,
                      ),
                      isPassword: true,
                      defaultSuffixIcon: isSuffixIcon ? IconButton(
                        icon: defaultPrefixIconWidget(
                            'assets/icons/close-24px.svg'),
                        onPressed: () {
                          passCodeController.text = '';
                        },
                      ) :SizedBox(),
                      label: 'Pass code (6-digits)',
                      validatorReturnValue: 'You must enter the pass code',
                    ),
                    SizedBox(
                      height: 49.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0,),
                      child: defaultMaterialButton(
                          defaultMaterialButtonLabel: 'Login',
                          defaultMaterialButtonPressed:(){
                              if(formKey.currentState!.validate())
                              {
                              AppCubit.get(context).signInWithKeyAndPassCode(
                              passCode: passCodeController.text.trim() +
                              '@bundle.com',
                              key: keyPasswordController.text.trim(),);
                              }
                              else{}


                          }
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dont\' have an account ?',
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
                        defaultTextButton(defaultTextButton: 'Sign up',
                            defaultTextButtonPressed: () {
                              navigateTo(context, NewSignUpScreen());
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is LoginUserSuccessState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainScreen()));
        }
        if (state is LoginUserErrorState) {
         Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionScreen()) );
        }
      },
    );
  }

  void changeSuffixIconWhenChanged(String value) {
    if (value.isNotEmpty) {
      setState(() {
        isSuffixIcon = true;
      });
    } else {
      setState(() {
        isSuffixIcon = false;
      });
    }
  }
}
