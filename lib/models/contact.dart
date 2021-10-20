import 'message.dart';

class Contact implements Comparable{
  int id;
  String token;
  String name;
  late Message lastMessage;
  Contact({required this.id, required this.token, required this.name});
  void setMessage(Message message){
    lastMessage = message;
  }
  static List<Contact> fromJson(List<dynamic> map) {
    List<Contact> contacts = [];
    for (var element in map) {
      contacts.add(Contact(
          id: element['id'], token: element['token'], name: element['name']));
    }
    return contacts;
  }

  @override
  int compareTo(other) {

    if(lastMessage.message == "" && other.lastMessage.message  == "") {
      return 0;
    }
    if(lastMessage.message == ""){
      return -1;
    }
    if(other.lastMessage.message  == ""){
      return 1;
    }
    return lastMessage.dateTime.compareTo(other.lastMessage.dateTime);

  }
}
