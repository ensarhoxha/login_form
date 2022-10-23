import 'package:flutter/material.dart';
import 'package:login_form/design/colors.dart';
import 'package:login_form/design/text_styles.dart';
import 'package:login_form/provider/authentication_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';


class AppPinPut extends StatelessWidget {
  const AppPinPut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: (pin) {
        if (pin == '2222') return null;

        return 'Your code is invalid';
      },
      defaultPinTheme: PinTheme(
        textStyle: pinPutTextStyle,
        decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 60.0,
        height: 60.0,
      ),
      errorPinTheme: PinTheme(
        textStyle: pinPutTextStyle,
        decoration: BoxDecoration(
          color: lightGreyColor,
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 60.0,
        height: 60.0,
      ),
      length: 4,
      keyboardType: TextInputType.number,
      controller: context.read<AuthenticationProvider>().codeController,
      onChanged: (code) {
        context.read<AuthenticationProvider>().validateCode(code);
      },
      errorText: "Please enter verification code",
    );
  }
}