abstract class AppState{}
class InitialPhoneAuthState extends AppState{}
class LoadingPhoneAuthState extends AppState{}
class SuccessfulPhoneAuthState extends AppState{}
class ErrorPhoneAuthState extends AppState{
  final String error;
  ErrorPhoneAuthState(this.error);
}
class PhoneOtpVerifiedState extends AppState{}
class ErrorPhoneOtpVerifiedState extends AppState{
  final String error;
  ErrorPhoneOtpVerifiedState(this.error);
}
class RegisterUserSuccessState extends AppState{}
class RegisterUserErrorState extends AppState{
  final String error;

  RegisterUserErrorState(this.error);
}
class LoginUserSuccessState extends AppState{}
class LoginUserErrorState extends AppState{
  final String error;

  LoginUserErrorState(this.error);
}
class CreateUserSuccessState extends AppState{}
class CreateUserErrorState extends AppState{
  final String error;

  CreateUserErrorState(this.error);
}
class ChangeButtonNavBarState extends AppState{}