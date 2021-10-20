import 'package:hive/hive.dart';
part 'message.g.dart';

@HiveType(typeId: 0)
class Message{
  @HiveField(0)
  int userId;
  @HiveField(1)
  String message;
  @HiveField(2)
  late DateTime dateTime;
  @HiveField(3)
  bool ownMessage;
  Message({required this.userId,required this.message,required this.ownMessage}){
    dateTime = DateTime.now();
  }
}