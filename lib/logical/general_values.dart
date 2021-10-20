import 'dart:async';

import 'package:behtrino_test/constant/const_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GeneralValues {
  static late GeneralValues generalValues;
  late String phoneNumber;
  late String token;
  Map<String, String> header = {
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json',
  };
  StreamController<String> controller = StreamController<String>();


  GeneralValues() {
    setTokenToHeader();
  }
  void setPhoneNumber(String phone){
    phoneNumber = phone;
  }
  // Get token from database and set to header
  Future<void> setTokenToHeader() async {
    final _prefs = await SharedPreferences.getInstance();
    if (_prefs.containsKey('token')) {
      String? _token = _prefs.getString('token');
      header['Authorization'] = "Token $_token";
      token = _prefs.getString('token')!;
    }
  }

}
Future<dynamic>? postTemplate(String url,var body) async {
  try{
    var _body = convert.json.encode(body);
    http.Response response = await http.post(Uri.parse(baseOfUrlServer + url) , headers: GeneralValues.generalValues.header , body: _body);
    if(response.statusCode == 200 )
      {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        if(_jsonResponse['meta']['status_code'] == 200) {
          return _jsonResponse;
        }
      }
  }
  catch(e){
    rethrow;
  }
}
Future<dynamic>? getTemplate(String url) async {
  try{
    http.Response response = await http.get(Uri.parse(getOfUrlServer+url),headers: GeneralValues.generalValues.header);
    if(response.statusCode == 200 )
      {
        String body = convert.utf8.decode(response.bodyBytes);
        var _jsonResponse = convert.jsonDecode(body);
        if(_jsonResponse['meta']['status_code'] == 200) {
          return _jsonResponse;
        }
      }
  }
  catch(e){
    rethrow;
  }
}


