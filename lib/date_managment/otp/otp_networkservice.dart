
import 'package:behtrino_test/logical/general_values.dart';

class OtpNetworkService{
  sendCodeOtpToServer(String phoneNumber, String code) async {
    var body = {
      "username" : phoneNumber,
      "password" : code
    };
    var response = await postTemplate('token_sign/',body);
    return response;
  }

  }


