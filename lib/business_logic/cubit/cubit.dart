import 'dart:math';
import 'package:bundle_app/business_logic/cubit/states.dart';
import 'package:bundle_app/model/social_user_model.dart';
import 'package:bundle_app/modules/chats/chat_screen.dart';
import 'package:bundle_app/modules/posts/post_screen.dart';
import 'package:bundle_app/modules/settings/seeting_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialPhoneAuthState());
  int curIndex=0;
  List listScreen=
  [
    PostScreen(),
    ChatScreen(),
    SettingScreen(),
  ];
  List titleScreen=
  [
    'Posts',
    'Chat',
    'Setting',
  ];
  void changeNavbarBottomIndex(index)
  {
    curIndex=index;
    emit(ChangeButtonNavBarState());
  }
  late String verificationId;
  //late String uId;
  static AppCubit get(context) => BlocProvider.of(context);
  Future<void> submitPhoneNumber(String userPhoneNumber) async {
    emit(LoadingPhoneAuthState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20${userPhoneNumber}',
      timeout: const Duration(seconds: 10),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  //some mobile discover code and write it
  void verificationCompleted(PhoneAuthCredential credential) async {
    await singIn(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    emit(ErrorPhoneAuthState(e.toString()));
    print(e.toString());
  }

  void codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    emit(SuccessfulPhoneAuthState());
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submittedOptRecieved(String otpReceived) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpReceived);
    await singIn(credential);
  }

  Future<void> singIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerifiedState());
    } catch (error) {
      emit(ErrorPhoneOtpVerifiedState(error.toString()));
    }
  }

  Future<void> singOut(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signOut();
  }

  User getCurrentUserLoggedData() {
    User currentUserLogged = FirebaseAuth.instance.currentUser!;
    return currentUserLogged;
  }

  ////////////////////create User///////////////
  void userRegister({
    required String name,
    required String userName,
    required String passCode,
    required String phone,
    required String key,
  }) {
    print('Auth User Register is Statrt');
    print(passCode);
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email:passCode.trim(),password: key.trim())
        .then((value) {
      emit(RegisterUserSuccessState());
      userCreate(
          name: name,
          userName: userName,
          passCode: passCode,
          phone: phone,
          key: key,
          uId: value.user!.uid);
    }).catchError((error) {
      emit(RegisterUserErrorState(error.toString()));
      print(error.toString());
    });
  }

  void signInWithKeyAndPassCode({
    required String passCode,
    required String key,

  }) {
    print('pass code${passCode}');
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email:passCode.trim(), password:key.trim())
        .then((value) {
      emit(LoginUserSuccessState());

    }).catchError((error) {
      emit(LoginUserErrorState(error.toString()));
    });
  }

  userCreate({
    required String name,
    required String userName,
    required String passCode,
    required String phone,
    required String key,
    required String uId,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      userName: userName,
      passCode: passCode,
      phone: phone,
      uId: uId,
      key: key,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
  String generateRandomPassword(){
    final length=30;
    final lettersLowerCase='abcdefghijklmnopqrstuvwxyz';
    final lettersUpperCase='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final numbers='1234567890';
    final special='@#\$%&+=!.(){}^*?';
    String chars='';
    chars+=lettersUpperCase;
    chars+=lettersLowerCase;
    chars+=numbers;
    chars+=special;

    return List.generate(length, (index) {
      final indexRandom=Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }
  ////////////signInByUser///////////////
 /* void signInWithKeyAndPassCode({
    required String key,
    required String passCode,
  }) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: passCode.trim(), password:key.trim() )
        .then((value) {
      emit(LoginUserSuccessState());
    }).catchError((error) {
      emit(LoginUserErrorState(error.toString()));
      print(error.toString());
    });
  }*/

}
