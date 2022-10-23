import 'package:flutter/material.dart';
import 'package:login_form/components/app_button.dart';
import 'package:login_form/components/app_pin_put.dart';
import 'package:login_form/components/footer_text.dart';
import 'package:login_form/design/colors.dart';
import 'package:login_form/design/spacing.dart';
import 'package:login_form/design/text_styles.dart';
import 'package:login_form/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: darkGreyColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: maxSpacing, right: maxSpacing,top: 50),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Enter Code",
                  style: headerTextStyle,
                ),
              ),
              const SizedBox(height: mediumSpacing,),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "We have sent a code to ",
                            style: bodyTextStyle
                        ),
                        TextSpan(
                            text: "${context.read<AuthenticationProvider>().emailController.text}\n",
                            style: bodyBoldTextStyle.copyWith(fontWeight: FontWeight.w700)
                        ),
                        const TextSpan(
                          text: "Please check your email and the code.",
                          style: bodyTextStyle,
                        )
                      ]
                  )
              ),
              const SizedBox(height: biggestSpacing,),
              const AppPinPut(),
              const SizedBox(height: biggestSpacing,),
              AppButton(
                  onTap: () {
                    context.read<AuthenticationProvider>().continueToSuccessScreen(context);
                  },
                  buttonTitle: "Continue",
                  isEnabled: context.watch<AuthenticationProvider>().codeIsValid,
              ),
              const SizedBox(height: maxSpacing,),
              RichText(
                  text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "Didn't receive the code?",
                            style: bodyBoldTextStyle
                        ),
                        TextSpan(
                            text: " Resend it",
                            style: textButtonTextStyle
                        )
                      ]
                  )
              ),
              const Spacer(),
              const FooterText(),
            ],
          ),
        ),
      ),
    );
  }
}
