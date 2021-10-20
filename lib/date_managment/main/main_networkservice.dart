
import 'package:behtrino_test/logical/general_values.dart';
var firstConnect = false;
class MainNetworkService {
  fetchContactFromServer() async {
    try {
      var response = await getTemplate('utils/challenge/contact_list/');
      if(response == null){
        return null;
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }


}
