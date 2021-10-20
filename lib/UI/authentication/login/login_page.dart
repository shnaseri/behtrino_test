import 'package:behtrino_test/UI/authentication/login/utils/number_textfield_component.dart';
import 'package:behtrino_test/UI/authentication/utils/text_top_page.dart';
import 'package:behtrino_test/UI/utils/blank_expanded_component.dart';
import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/constant/path_router_repository.dart';
import 'package:behtrino_test/constant/string_repository.dart';
import 'package:behtrino_test/state_managment/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(gradient: linearGradient),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      ExpandedBlank(),
                      const Flexible(
                        child: TextTopOfPage(),
                        flex: 2,
                      ),
                      Flexible(
                          flex: 3,
                          child: NumberTextFieldComponent(
                            blocContext: context,
                            formKey: formKey,
                          )),
                      ExpandedBlank(
                        flex: 4,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: getBottomPosition(context),
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 56,
                      child: MaterialButton(
                        onPressed: () async {
                          bool status = false;
                          if(!formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).changeStatusToBadNumber(state.phoneNumber);
                            return ;
                          }
                          if (state is LoginEnterPhoneNumberState) {
                            status = await BlocProvider.of<LoginCubit>(context).sendPhoneNumber(state.phoneNumber);
                          }if (state is LoginBadNumberState) {
                            status = await BlocProvider.of<LoginCubit>(context).sendPhoneNumber(state.phoneNumber);
                          }if (state is LoginLoadedFromServerState) {
                            status = await BlocProvider.of<LoginCubit>(context).sendPhoneNumber(state.phoneNumber);
                          }
                          if(status) {
                            Navigator.pushNamed(context, otpPagePath);
                          }
                        },
                        child: Container(
                          decoration: boxDecorationRoundedWithShadow(8,
                              backgroundColor: isEnableButton(state)
                                  ? colorButtonDisable
                                  : colorButtonEnable),
                          child: state is LoginLoadingFromServerState
                              ? const Center(child: CircularProgressIndicator (color: Colors.white,))
                              : Center(
                                  child: Text(
                                    registerButton,
                                    style: primaryTextStyle(
                                        color: Colors.white,
                                        weight: FontWeight.w700),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool isEnableButton(LoginState state) => state is LoginInitial;

  double getBottomPosition(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      return context.height() / 6;
    } else {
      return MediaQuery.of(context).viewInsets.bottom + 10;
    }
  }

}
