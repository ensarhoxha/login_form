import 'package:flutter/material.dart';
import 'package:login_form/components/app_button.dart';
import 'package:login_form/components/footer_text.dart';
import 'package:login_form/components/loader.dart';
import 'package:login_form/design/asset_paths.dart';
import 'package:login_form/design/colors.dart';
import 'package:login_form/design/spacing.dart';
import 'package:login_form/design/text_styles.dart';
import 'package:login_form/provider/authentication_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<AuthenticationProvider>().screenLoading
          ? const Loader()
          : SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: maxSpacing, right: maxSpacing),
                child: Column(
                  children: [
                    Image.asset(
                      blackLogoPath,
                      fit: BoxFit.contain,
                    ),
                    const Text(
                      "Login",
                      style: headerTextStyle,
                    ),
                    const SizedBox(
                      height: minSpacing,
                    ),
                    const Text(
                      "Enter your email to receive a code.",
                      style: bodyTextStyle,
                    ),
                    const SizedBox(
                      height: maxSpacing,
                    ),
                    TextField(
                      controller: context
                          .read<AuthenticationProvider>()
                          .emailController,
                      onChanged: (String email) {
                        context
                            .read<AuthenticationProvider>()
                            .validateEmail(email);
                      },
                      decoration: InputDecoration(
                        errorText: context
                                .watch<AuthenticationProvider>()
                                .showEmailError
                            ? "Email is not right"
                            : null,
                        hintText: "Email Address",
                        filled: true,
                        fillColor: lightGreyColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: context
                                  .watch<AuthenticationProvider>()
                                  .showEmailError
                              ? const BorderSide(
                                  color: Colors.red,
                                  width: 1.0,
                                )
                              : const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: maxSpacing,
                    ),
                    AppButton(
                      onTap: () {
                        context
                            .read<AuthenticationProvider>()
                            .sendCode(context);
                      },
                      buttonTitle: "Send Code",
                      isEnabled:
                          context.watch<AuthenticationProvider>().emailIsValid,
                    ),
                    const SizedBox(
                      height: mediumSpacing,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account?",
                          style: bodyBoldTextStyle),
                      TextSpan(text: " Sign up", style: textButtonTextStyle)
                    ])),
                    const Spacer(),
                    const FooterText()
                  ],
                ),
              ),
            ),
    );
  }
}
