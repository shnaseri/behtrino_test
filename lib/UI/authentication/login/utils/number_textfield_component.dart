import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/constant/const_repository.dart';
import 'package:behtrino_test/constant/string_repository.dart';
import 'package:behtrino_test/state_managment/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class NumberTextFieldComponent extends StatelessWidget {
  BuildContext blocContext;
  GlobalKey<FormState> formKey;
  NumberTextFieldComponent({Key? key, required this.blocContext,required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      filled: true,

        fillColor: Colors.white,
        hintText: hintTextForLoginPage,
        hintStyle: const TextStyle(
          color: Color(0xffE0E0E0),

        ),

        prefixIcon: buildPrefixIcon(),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: const Color(0xff828282), width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff828282), width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1)));
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: buildDescriptionTopOfTextField(context),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex:2,
                  child: TextFormField(
                  scrollPadding: EdgeInsets.zero,
                    validator: (value){
                      if(value!.length < 13){
                        return " ";
                      }
                      return null;
                    },
                    decoration: inputDecoration,
                    style: const TextStyle(
                        letterSpacing: 3,
                        color: colorOfTextOfPhoneNumber,
                        fontFamily: 'Dana',
                        fontWeight: FontWeight.w800),
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    inputFormatters: [MaskedInputFormatter('#### ### ####')],
                    onChanged: (String value) {
                      BlocProvider.of<LoginCubit>(blocContext)
                          .changeStateForTextField(value);},
                  ).paddingSymmetric(horizontal: 30, vertical: 0),
                ),
                Flexible(
                  flex:1,
                  child: state is LoginBadNumberState ? const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      errorTextForLoginPage,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: Colors.red,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ):Container(),
                )
              ],
            ),
            flex: 3,
          ),

        ],
      ),
    );
  },
);
  }

  FractionallySizedBox buildPrefixIcon() {
    return FractionallySizedBox(
        widthFactor: 0.15,
        child: Row(
          children: [
            Flexible(
                flex: 2,
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(baseOfPathMedia + 'iran.png'))),
                )),
            const Expanded(
              flex: 1,
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: IntrinsicHeight(
                    child: VerticalDivider(
                  thickness: 2,
                  width: 2,
                  indent: 2,
                  color: Color(0xffcccccc),
                )),
              ),
            )
          ],
        ).paddingLeft(3),
      );
  }

  Widget buildDescriptionTopOfTextField(BuildContext context) {
    return Center(
      child: Text(
        descriptionTopOfTextFieldLoginPage,
        textDirection: TextDirection.rtl,
        style: primaryTextStyle(
            size:
                Theme.of(context).textTheme.subtitle1?.fontSize!.toInt() ?? 50,
            weight: FontWeight.w600),
      ),
    );
  }
}
