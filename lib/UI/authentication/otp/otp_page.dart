import 'package:behtrino_test/UI/authentication/utils/text_top_page.dart';
import 'package:behtrino_test/UI/utils/appbars/appbar_withback.dart';
import 'package:behtrino_test/UI/utils/blank_expanded_component.dart';
import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/state_managment/OTP/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/otp_code_component.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(),
      child: Scaffold(
        appBar: AppBarWithBack(context),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(gradient: linearGradient),
          child: BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              return Column(
                children: [
                  ExpandedBlank(),
                  const Flexible(
                    child: TextTopOfPage(),
                    flex: 2,
                  ),
                  Expanded(
                    child: OtpCodeComponent(),
                    flex: 3,
                  ),
                  ExpandedBlank(
                    flex: 5,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
