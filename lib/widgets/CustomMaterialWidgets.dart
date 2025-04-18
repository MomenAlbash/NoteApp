
import 'package:flutter/material.dart';

class MaterialButtonWidgets extends StatelessWidget {
  MaterialButtonWidgets({
    required this.textColor, required this.MaterialColor,
    Key? key, required this.onPressed, required this.MaterialText,
  }) : super(key: key);
  final Function() onPressed;
  final String MaterialText;
  final Color MaterialColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:MaterialColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(MaterialText,style: TextStyle(fontSize: 20,color: textColor),),
      ),
    );
  }
}