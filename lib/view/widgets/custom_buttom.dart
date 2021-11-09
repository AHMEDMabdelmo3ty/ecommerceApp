import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double fontSized;

  final Color color;

  final Function onPress;

  CustomButton({
    @required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor, this.fontSized=16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryColor , padding: EdgeInsets.all(10), shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      ),


      onPressed: onPress,

      child: CustomText(
        alignment: Alignment.center,
        text: text,
        fontSize: fontSized,
        color: Colors.white,
      ),
    );
  }
}
