import 'package:behtrino_test/date_managment/login/login_repository.dart';
import 'package:behtrino_test/date_managment/otp/otp_networkservice.dart';
import 'package:behtrino_test/logical/general_values.dart';
import 'package:behtrino_test/models/user.dart';
import 'package:nb_utils/nb_utils.dart';

class OtpRepository {
  late OtpNetworkService otpNetworkService;
  late LoginRepository loginRepository;

  OtpRepository() {
    otpNetworkService = OtpNetworkService();
    loginRepository = LoginRepository();
  }

  Future<bool> sendCodeOtp(String phoneNumber, String code) async {
    try {
      var response =
          await otpNetworkService.sendCodeOtpToServer(phoneNumber, code);
      if (response == null ) {
        return false;
      }
      await setTokenToSharedPreferences(response['data']['token']);
      User.userLogin = User(username: response['data']['user']['username']);
      await GeneralValues.generalValues.setTokenToHeader();
      return true;
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> resendCodeOtp(String phoneNumber) async {
    try {
      return await loginRepository.sendPhoneNumber(phoneNumber);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> setTokenToSharedPreferences(String token) async {
    var _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
  }
}
