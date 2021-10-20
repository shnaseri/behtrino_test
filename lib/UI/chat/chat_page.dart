import 'package:behtrino_test/UI/chat/components/body_of_chat.dart';
import 'package:behtrino_test/UI/chat/components/text_field_component.dart';
import 'package:behtrino_test/UI/utils/appbars/appbar_title_profile.dart';
import 'package:behtrino_test/constant/color_repository.dart';

import 'package:behtrino_test/models/contact.dart';
import 'package:behtrino_test/state_managment/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController controller = TextEditingController();

class ChatPage extends StatefulWidget {
  Contact contact;
  final int index;

  ChatPage({Key? key, required this.contact, required this.index})
      : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late BuildContext chatContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(contact: widget.contact),
      child: WillPopScope(
        onWillPop: onWillScope,
        child: Scaffold(
            appBar: AppBarTitleProfile(context, widget.index,
                title: widget.contact.name, functionBack: onWillScope),
            body: Container(
              decoration: const BoxDecoration(gradient: linearGradient),
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  chatContext = context;
                  if(state is ChatErrorState){
                    // toast(hasErrorChatPage);
                    BlocProvider.of<ChatCubit>(context).emit(ChatInitial());
                  }
                  if (state is ChatInitial) {
                    BlocProvider.of<ChatCubit>(context).fetchConnect();
                  }
                  return Stack(
                    children: [
                      const BodyOfChatPage(),
                      TextFieldForChatPage(
                        contact: widget.contact,
                      )
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }

  Future<bool> onWillScope() async {
    // BlocProvider.of<ChatCubit>(chatContext).disconnectMq();
    return true;
  }
}

