import 'package:behtrino_test/UI/utils/appbars/TimeAgo/message.dart';


/// English Messages
class PersianMessage extends Messages {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'پیش';

  @override
  String suffixFromNow() => 'از الان';

  @override
  String secsAgo(int seconds) => '$seconds ثانیه ';

  @override
  String minAgo(int minutes) => 'یک دقیقه';

  @override
  String minsAgo(int minutes) => '$minutes دقیقه ';

  @override
  String hourAgo(int minutes) => 'یک ساعت';

  @override
  String hoursAgo(int hours) => '$hours ساعت ';

  @override
  String dayAgo(int hours) => 'یک روز';

  @override
  String daysAgo(int days) => '$days روز ';

  @override
  String wordSeparator() => ' ';
}
