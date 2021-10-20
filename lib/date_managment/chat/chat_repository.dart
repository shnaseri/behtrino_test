
import 'package:behtrino_test/date_managment/chat/chat_networkservice.dart';
import 'package:behtrino_test/logical/general_values.dart';
import 'package:behtrino_test/logical/message_repository.dart';
import 'package:behtrino_test/models/contact.dart';
import 'package:behtrino_test/models/message.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class ChatRepository{

  late ChatNetworkService chatNetworkService;
  late MqttServerClient client;
  Function todoSubscribe;
  ChatRepository({required this.todoSubscribe}){
    chatNetworkService = ChatNetworkService(subscribeFromServer: subscribeMessage);
  }
  connectMMQT(String userToken) async {
    try {
      String otpToken = GeneralValues.generalValues.token;
      client  = (await chatNetworkService.connectMQTT(otpToken,userToken)) ?? client;
    }
    catch(error){
      rethrow;
    }
  }
  disConnectMQTT(){
    client.disconnect();
  }

  pushMessage(Contact user, String messageText) async{
    try{
      String otpToken = GeneralValues.generalValues.token;
      await chatNetworkService.pushMessageToServer(otpToken,user.token,messageText);
      Message message = await getNewMessageAdd(user, messageText,true);
      return message;
    }catch(error){
      rethrow;
    }
  }

  Future<Message> getNewMessageAdd(Contact user, String messageText,bool own ) async {
    var message = Message(userId: user.id,message: messageText,ownMessage: own);
    await MessageRepository.messageRepository.addMessage(message);
    return message;
  }

  getMessages(int id) {
    return MessageRepository.messageRepository.getMessagesById(id);
  }

  subscribeMessage(String message) async {
    try{
      todoSubscribe(message);
    }catch(error){
      rethrow;
    }
  }


}