
import 'package:behtrino_test/logical/general_values.dart';

class LoginNetworkService{

  LoginNetworkService();

  Future<bool> sendPhoneNumberToServer(String phoneNumber) async {
    var body = {
      "phone" : phoneNumber
    };
    var response = await postTemplate('users/phone_verification/',body);
    if(response == null) {
      return false;
    }

    return true;
  }

}