import 'package:behtrino_test/date_managment/login/login_networkservice.dart';
import 'package:behtrino_test/logical/general_values.dart';

class LoginRepository{

  late LoginNetworkService loginNetworkService;
  LoginRepository(){
    loginNetworkService = LoginNetworkService();
  }

  Future<bool> sendPhoneNumber(String phoneNumber) async {
    try{
      GeneralValues.generalValues.setPhoneNumber(phoneNumber);
      return await loginNetworkService.sendPhoneNumberToServer(phoneNumber);

    }
    catch(error){
      rethrow;
    }

  }

}