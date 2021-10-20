import 'package:behtrino_test/models/message.dart';
import 'package:hive/hive.dart';

class MessageRepository {
  static late MessageRepository messageRepository;
  late Box<Message> box;
  late List<Message> messages;

  MessageRepository() {
    box = Hive.box<Message>('messages');
    messages = box.values.toList();
  }

  getLastMessageById(int id) {
    List<Message> filterd =
        messages.where((element) => element.userId == id).toList();

    if (filterd.isNotEmpty) {
      return filterd.elementAt(filterd.length - 1);
    } else {
      return Message(userId: id, message: "", ownMessage: false);
    }
  }

  getMessagesById(int id) {
    List<Message> filterd =
        messages.where((element) => element.userId == id).toList();
    return filterd;
  }

  Future<void> addMessage(Message message) async {
    await box.add(message);
    messages = box.values.toList();
  }

  Future<void> deleteMessage(int index, int id) async {
    try {
      List<Map<String, dynamic>>? filterd = [];
      for (var element in messages) {
        if(element.userId == id) {
          filterd.add({
          'message': element,
          'index': messages.indexOf(element).toInt()
        });
        }
      }

        await box.deleteAt((filterd[index]['index']) ?? 0);
        messages = box.values.toList();
    } catch (error) {
      rethrow;
    }
  }
}
