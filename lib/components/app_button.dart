import 'package:flutter/material.dart';
import 'package:login_form/design/colors.dart';
import 'package:login_form/design/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    required this.isEnabled,
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonTitle;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: double.infinity,
      child: TextButton(
        onPressed: isEnabled ? onTap : null,
        child: Text(
          buttonTitle,
          style: buttonTextStyle,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                isEnabled ? blueColor : blueColor.withOpacity(0.3)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)))),
      ),
    );
  }
}
