import 'package:behtrino_test/date_managment/login/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late LoginRepository repository;

  LoginCubit() : super(LoginInitial()) {
    repository = LoginRepository();
  }

  void changeStateForTextField(String value) {
    if (value.isNotEmpty) {
      emit(LoginEnterPhoneNumberState(value));
      return;
    }
    emit(LoginInitial());
  }

  Future<bool> sendPhoneNumber(String phoneNumber) async {
    emit(LoginLoadingFromServerState());
    try {
      String editPhoneNumber = phoneNumber.replaceAll(' ', '');
      bool status = await repository.sendPhoneNumber(editPhoneNumber);
      emit(status ? LoginLoadedFromServerState(phoneNumber) : LoginBadNumberState(phoneNumber));
      return status;
    } catch (error) {
      return false;
    }
  }

  void changeStatusToBadNumber(String phoneNumber) {
    emit(LoginBadNumberState(phoneNumber));
  }
}
