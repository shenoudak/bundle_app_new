import 'package:bundle_app/business_logic/cubit/cubit.dart';
import 'package:bundle_app/modules/login/login_new.dart';
import 'package:bundle_app/modules/otp_page/otp_test.dart';
import 'package:bundle_app/modules/permission_screen/permission_screen.dart';
import 'package:bundle_app/modules/signup/new_signup_screen.dart';
import 'package:bundle_app/shared/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/bloc_observer.dart';
import 'layout/mainscreen/main_screen.dart';
import 'modules/main_splash/main_splash_screen.dart';
import 'modules/on_boarding/onboarding_scren.dart';
void main() {

  runApp(const MainSplashScreen());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.red,
    statusBarIconBrightness: Brightness.dark,// navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
    Bloc.observer = MyBlocObserver();
  Firebase.initializeApp();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context) =>AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
         bottomNavigationBarTheme: BottomNavigationBarThemeData(
           selectedItemColor: primaryColor,
           unselectedItemColor: Colors.grey,

         ),
         // appBarTheme: AppBarTheme(
         //   backgroundColor: Colors.white,
         //   elevation: 0.0,
         //   centerTitle: true,
         // ),

         //  appBarTheme: AppBarTheme(
         //   backgroundColor: Colors.white,
         //   elevation: 0.0,
         //   systemOverlayStyle: SystemUiOverlayStyle(
         //     statusBarColor: Colors.white,
         //     statusBarBrightness: Brightness.dark,
         //    // systemNavigationBarColor: Colors.red,
         //    // statusBarIconBrightness: Brightness.light,
         //   ),
         //
         // ),
         // primarySwatch:primaryColor,
          //fontFamily: 'Roboto',

          // appBarTheme: AppBarTheme(
          //   backgroundColor: primaryColor,
          //   elevation: 0.0,
          //   /*iconTheme: IconThemeData(
          //     color: Colors.white,
          //   ),*/
          // ),
        ),
        themeMode: ThemeMode.light,
        home:MainScreen(),
      ),
    );
  }
}
