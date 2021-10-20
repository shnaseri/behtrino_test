part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoadingCodeState extends OtpState{}

class OtpLoadedCodeState extends OtpState{}

class OtpBadCode extends OtpState{}
