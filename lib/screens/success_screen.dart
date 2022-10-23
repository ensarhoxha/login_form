import 'package:flutter/material.dart';
import 'package:login_form/design/asset_paths.dart';
import 'package:login_form/design/colors.dart';
import 'package:login_form/design/spacing.dart';
import 'package:login_form/design/text_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(successIconPath,color: Colors.white,width: 64,height: 64,),
            const SizedBox(height: maxSpacing,),
            Text("Login was completed successfully",style: headerTextStyle.copyWith(color: Colors.white),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
