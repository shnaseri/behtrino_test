import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/models/message.dart';
import 'package:behtrino_test/state_managment/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
    required this.index,
  }) : super(key: key);

  final Message message;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return InkWell(
          onLongPress: () {
            BlocProvider.of<ChatCubit>(context).deleteMessage(index);
          },
          child: Container(
            padding:
            const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Align(
              alignment: (!message.ownMessage
                  ? Alignment.topRight
                  : Alignment.topLeft),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: (!message.ownMessage
                        ? receiverColorContainer
                        : senderColorContainer)),
                padding: const EdgeInsets.all(16),
                child: Text(
                  message.message,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}