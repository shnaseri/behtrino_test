part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  final String phoneNumber;
  LoginState(this.phoneNumber);
}

class LoginInitial extends LoginState {
  LoginInitial() : super('');
}

class LoginEnterPhoneNumberState extends LoginState {
  LoginEnterPhoneNumberState(String phoneNumber) : super(phoneNumber);
}

class LoginLoadingFromServerState extends LoginState {
  LoginLoadingFromServerState() : super('');
}

class LoginLoadedFromServerState extends LoginState {
  LoginLoadedFromServerState(String phoneNumber) : super(phoneNumber);
}

class LoginBadNumberState extends LoginState{
  LoginBadNumberState(String phoneNumber) : super(phoneNumber);
}
