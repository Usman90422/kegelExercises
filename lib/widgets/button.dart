import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    this.width,
    this.borderRadius,
    required this.height,
    this.textSize,
    this.letterSpacing,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final  width;
  final double height;
  final double? borderRadius;
  final double? textSize;
  final double? letterSpacing;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text,style: TextStyle(color: textColor,fontSize: textSize ??12,letterSpacing:letterSpacing?? 2),),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius??12))),
      ),
    );
  }
}