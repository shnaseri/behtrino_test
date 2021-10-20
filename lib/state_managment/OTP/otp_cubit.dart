import 'package:behtrino_test/date_managment/otp/otp_repository.dart';
import 'package:behtrino_test/logical/general_values.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  late OtpRepository otpRepository;

  OtpCubit() : super(OtpInitial()) {
    otpRepository = OtpRepository();
  }

  Future<bool> sendCodeOtp(String code) async {
    emit(OtpLoadingCodeState());
    try {
      var phoneNumber = GeneralValues.generalValues.phoneNumber;
      bool status = await otpRepository.sendCodeOtp(phoneNumber, code);
      emit(status ? OtpLoadedCodeState() : OtpBadCode());
      return status;
    } catch (error) {
      return false;
    }
  }

  Future<bool> resendCode() async {
    try {
      bool status = await otpRepository
          .resendCodeOtp(GeneralValues.generalValues.phoneNumber);
      return status;
    } catch (error) {
      return false;
    }
  }

  Future<void> changeState() async {
   emit(OtpInitial());
  }
}
