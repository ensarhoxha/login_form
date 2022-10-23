import 'package:flutter/material.dart';
import 'package:login_form/design/text_styles.dart';

class FooterText extends StatelessWidget {
  const FooterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: [
              const TextSpan(
                  text: "Copyright @ ",
                  style: bodyBoldTextStyle
              ),
              TextSpan(
                  text: "rmpos.io ",
                  style: bodyBoldTextStyle.copyWith(fontWeight: FontWeight.w700)
              ),
              const TextSpan(
                text: "2022",
                style: bodyBoldTextStyle,
              )
            ]
        )
    );
  }
}
