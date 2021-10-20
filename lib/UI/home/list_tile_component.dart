import 'package:behtrino_test/UI/chat/chat_page.dart';
import 'package:behtrino_test/UI/utils/appbars/TimeAgo/get_time_ago.dart';
import 'package:behtrino_test/constant/const_repository.dart';
import 'package:behtrino_test/constant/string_repository.dart';
import 'package:behtrino_test/models/contact.dart';
import 'package:behtrino_test/models/message.dart';
import 'package:behtrino_test/state_managment/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTileWidgetContact extends StatelessWidget {
  const ListTileWidgetContact({
    Key? key,
    required this.contact,
    required this.index,
    required this.message,
  }) : super(key: key);

  final Contact contact;
  final int index;
  final Message message;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            if(state is MainLoadedState) {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (_) => ChatPage(contact: contact, index: index)))
                  .then((value) {
                BlocProvider.of<MainCubit>(context).refreshLastMessage(state.contact);
              }
              );
            }
          },
          leading: Container(
            width: 50,
            margin: const EdgeInsets.only(left: 13),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      baseOfPathMedia + 'profile${index + 1}.png',
                    ),
                    fit: BoxFit.contain)),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    getTimeWidget(),
                    style: TextStyle(
                        color: const Color(0xff58616A),
                        fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
                  )
                ],
              ),
              Text(
                getMessage(),
                maxLines: 1,
                style: const TextStyle(color: Color(0xff58616A)),
              )
            ],
          ),
        );
      },
    );
  }

  String getMessage() =>  message.message == "" ? hintTextForNotFound :message.message;

  String getTimeWidget() =>  message.message == "" ? timeTextNotFound : GetTimeAgo.parse(message.dateTime);
}
