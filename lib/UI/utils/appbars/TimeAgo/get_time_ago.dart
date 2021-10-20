import 'package:behtrino_test/UI/utils/appbars/TimeAgo/message.dart';
import 'package:behtrino_test/UI/utils/appbars/TimeAgo/persian_time_ago.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
class GetTimeAgo {
  static String _defaultLocale = 'fa';
  static Messages messages = PersianMessage();
  static final Map<String, Messages> _messageMap = {
    'fa' : messages,
  };

  ///
  /// Sets the default [locale]. By default it is `en`.
  ///
  /// Example:
  /// ```dart
  /// setDefaultLocale('fr');
  /// ```
  ///

  static void setDefaultLocale(String locale) {
    assert(_messageMap.containsKey(locale), '[locale] must be a valid locale');
    _defaultLocale = locale;
  }

  ///
  /// [parse] formats provided [dateTime] to a formatted time
  /// like 'a minute ago'.
  /// - If [locale] is passed will look for message for that locale.
  /// - If [pattern] is passed will be used as the DateFormat pattern.
  ///

  static String parse(DateTime dateTime, {String? locale, String? pattern}) {
    final _locale = locale ?? _defaultLocale;
    final _message = _messageMap[_locale] ?? messages;
    final _pattern = pattern ?? "dd MMM, yyyy hh:mm aa";
    final date = DateFormat(_pattern).format(dateTime);
    var elapsed =
        DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch;

    var _prefix = _message.prefixAgo();
    var _suffix = _message.suffixAgo();

    ///
    /// Getting [seconds], [minutes], [hours], [days] from provided [dateTime]
    /// by subtracting it from current [DateTime.now()].
    ///

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;

    String msg;
    String result;
    if (seconds < 59) {
      msg = _message.secsAgo(seconds.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (seconds < 119) {
      msg = _message.minAgo(minutes.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (minutes < 59) {
      msg = _message.minsAgo(minutes.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (minutes < 119) {
      msg = _message.hourAgo(hours.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (hours < 24) {
      msg = _message.hoursAgo(hours.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (hours < 48) {
      msg = _message.dayAgo(hours.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else if (days < 8) {
      msg = _message.daysAgo(days.round());
      result = [_prefix, msg, _suffix]
          .where((res) => res.isNotEmpty)
          .join(_message.wordSeparator());
    } else {

      msg = date;
      result = date;
      if(_defaultLocale == 'fa'){
        Jalali j = Jalali.fromDateTime(dateTime);
        final f = j.formatter;
        result = f.d +" "+ f.mN +" "+ f.yy;
      }
    }

    return result;
  }
}
