
import 'package:behtrino_test/UI/utils/appbars/appbar_home.dart';
import 'package:behtrino_test/constant/color_repository.dart';

import 'package:behtrino_test/models/contact.dart';
import 'package:behtrino_test/state_managment/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'list_tile_component.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: Scaffold(
        appBar: AppBarHome(context),

        // extendBodyBehindAppBar: true,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: const BoxDecoration(
                gradient: linearGradient
            ),
            child: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                if (state is MainInitial) {
                  BlocProvider.of<MainCubit>(context).fetchContact();
                }
                if (state is MainLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is MainLoadedState) {
                  return SizedBox(
                    width: context.width(),
                    height: context.height(),
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 20),
                      itemBuilder: (context, index) {
                        Contact contact = state.contact[index];
                        return ListTileWidgetContact(
                          contact: contact,
                          index: index,
                          message: contact.lastMessage,
                        );
                      },
                      itemCount: state.contact.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          thickness: 1.5,
                          color: Color(0xffEBEBEB),
                          height: 20,
                        );
                      },
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

