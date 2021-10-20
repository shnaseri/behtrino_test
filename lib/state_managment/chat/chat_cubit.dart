import 'package:behtrino_test/date_managment/chat/chat_repository.dart';
import 'package:behtrino_test/logical/message_repository.dart';
import 'package:behtrino_test/models/contact.dart';
import 'package:behtrino_test/models/message.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  late ChatRepository chatRepository;
  Contact contact;
  ChatCubit({required this.contact}) : super(ChatInitial()){
    chatRepository = ChatRepository(todoSubscribe: functionForSubscribe);
  }

  Future<void> fetchConnect() async {
    try {
      contact = contact;
      await chatRepository.connectMMQT(contact.token);
      List<Message> messages = await chatRepository.getMessages(contact.id);
      emit(ChatConnectToServer(messages));
    }
    catch(error){
      rethrow;
    }
  }

  void disconnectMq() {
    chatRepository.disConnectMQTT();
  }
  Future<void> publishMessage(Contact user,String message) async {
    try {
      // emit(ChatSendMessage());
      await chatRepository.pushMessage(user, message);
      // await chatRepository.subscribeMessage(user);

      List<Message> messages = await chatRepository.getMessages(user.id);
      emit(ChatConnectToServer(messages));
    }
    catch(error){
      emit(ChatErrorState());
    }

  }

  functionForSubscribe(String message) async {
    await chatRepository.getNewMessageAdd(contact, message,false);
    List<Message> messages = await chatRepository.getMessages(contact.id);
    emit(ChatConnectToServer(messages));

  }

  Future<void> deleteMessage(int index) async {
    try {
      // emit(ChatSendMessage());// await chatRepository.subscribeMessage(user);

      await MessageRepository.messageRepository.deleteMessage(index,contact.id);
      List<Message> messages = await chatRepository.getMessages(contact.id);
      emit(ChatConnectToServer(messages));
    }
    catch(error){
      rethrow;
    }
  }

}
