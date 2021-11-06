import 'package:bundle_app/business_logic/cubit/cubit.dart';
import 'package:bundle_app/business_logic/cubit/states.dart';
import 'package:bundle_app/modules/key_screen/key_screen.dart';
import 'package:bundle_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTest extends StatelessWidget {
  final String name;
  final String userName;
  final String passCode;
  final String phoneNumber;
  final String generateKey;
 // final String phoneNumber;
  PinCodeTest(this.name,this.userName,this.passCode,this.phoneNumber,this.generateKey);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (BuildContext context, state) {
        if(state is LoadingPhoneAuthState){

        }

        if(state is PhoneOtpVerifiedState){
          print('Hi Otp Verified State');
          AppCubit.get(context).userRegister(name: name,userName: userName,phone: phoneNumber,passCode:
          passCode,key: generateKey,);
         navigateAndFinish(context, KeyScreen(generateKey));
        }
      },
      builder: (BuildContext context, Object? state) {
        return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                'Verify code',
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
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          alignment: Alignment.topLeft,
                          width: 440.0, height: 280.0,
                          fit: BoxFit.fitWidth,
                          image: Svg(
                              'assets/Photos/Private data-rafiki (1).svg'), //fit: BoxFit.cover,
                        ),
                        SizedBox(height: 34.0,),
                        Row(
                          children:
                          [
                            Text('Enter 6 - digits that we sent to',
                              style: TextStyle(color: HexColor('#2E3645'),
                                fontSize: 13,fontFamily: 'SegoeUI',
                                fontWeight: FontWeight.bold,),),
                            SizedBox(width: 12.0,),
                            Expanded(
                              child: Text('+02${phoneNumber}',
                                style: TextStyle(color: HexColor('#9676FF'),
                                  fontSize: 13,fontFamily: 'SegoeUI-Semibold',
                                  fontWeight: FontWeight.bold,),),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        PinCodeTextField(
                            pinTheme: PinTheme(
                              activeColor: HexColor('#2E3645'),
                              inactiveColor: Colors.grey,
                            ),
                            appContext: context,
                            length: 6,
                            keyboardType: TextInputType.number,
                            keyboardAppearance: Brightness.dark,
                            autoDismissKeyboard: false,
                            hintCharacter: '#',
                            textStyle: TextStyle(color: Colors.grey),
                            onCompleted: (value){
                              print(value);
                              AppCubit.get(context).submittedOptRecieved(value);
                              print(state.toString());



                            },
                            //cursorColor: Colors.grey,

                            onChanged: (value){}
                        ),
                        SizedBox(height: 33.0,),
                        Row(
                          children:
                          [
                            Text('Don\'t receive code ?',
                              style: TextStyle(color: HexColor('#2E3645'),
                                fontSize: 13,fontFamily: 'SegoeUI-Semibold',
                                fontWeight: FontWeight.bold,),),
                            SizedBox(width: 7.0,),
                            defaultTextButton(
                                defaultTextButton: 'RESEND AGAIN',
                                defaultTextButtonPressed: (){
                                  AppCubit.get(context).submitPhoneNumber(phoneNumber);
                                }),

                          ],
                        ),
                      ]
                  ),
                )
            )
        );
      },
    );
  }
}

/*class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Constants.PRIMARY_COLOR,
      body: GestureDetector(
        onTap: () {},
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(),
                  //Image.asset("${Constants.OTP_GIF_IMAGE}"),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Phone Number Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: "${widget.phoneNumber}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      obscuringWidget: FlutterLogo(
                        size: 24,
                      ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () => snackBar("OTP resend!!"),
                      child: Text(
                        "RESEND",
                        style: TextStyle(
                            color: Color(0xFF91D3B3),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                child: ButtonTheme(
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                      // conditions for validating
                      if (currentText.length != 6 || currentText != "123456") {
                        errorController!.add(ErrorAnimationType
                            .shake); // Triggering error shake animation
                        setState(() => hasError = true);
                      } else {
                        setState(
                              () {
                            hasError = false;
                            snackBar("OTP Verified!!");
                          },
                        );
                      }
                    },
                    child: Center(
                        child: Text(
                          "VERIFY".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: Offset(-1, 2),
                          blurRadius: 5)
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: TextButton(
                        child: Text("Clear"),
                        onPressed: () {
                          textEditingController.clear();
                        },
                      )),
                  Flexible(
                      child: TextButton(
                        child: Text("Set Text"),
                        onPressed: () {
                          setState(() {
                            textEditingController.text = "123456";
                          });
                        },
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}*/
