import 'package:behtrino_test/date_managment/main/main_networkservice.dart';
import 'package:behtrino_test/logical/message_repository.dart';
import 'package:behtrino_test/models/contact.dart';
import 'package:behtrino_test/models/message.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MainRepository {
  late MainNetworkService mainNetworkService;
  late MqttServerClient client;

  MainRepository() {
    mainNetworkService = MainNetworkService();
  }

  Future<List<Contact>?> fetchContactFromRepository() async{
    try{
      var response = await mainNetworkService.fetchContactFromServer();
      if(response == null) {
        return null;
      }
      return Contact.fromJson(response['data']);
    }
    catch(error){
      rethrow;
    }
  }

  fetchMessages() {}

  Message getLastMessage(int id) {
    return MessageRepository.messageRepository.getLastMessageById(id);
  }


}
