part of 'chat_cubit.dart';

@immutable
abstract class ChatState {
  final List<Message> messages;
  ChatState({required this.messages});
}

class ChatInitial extends ChatState {
  ChatInitial() : super(messages: []);
}

class ChatConnectToServer extends ChatState{
  ChatConnectToServer(List<Message> messages) : super(messages: messages);

}
class ChatSendMessage extends ChatState{
  ChatSendMessage(List<Message> messages) : super(messages: messages);
}

class ChatErrorState extends ChatState{
  ChatErrorState() : super(messages: []);

}