import 'package:flutter/material.dart';

class TextIconTile extends StatelessWidget {
  const TextIconTile({ this.onTap,required this.title, this.textColor}) ;

  final VoidCallback? onTap;
  final String title;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:  TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: textColor ?? Colors.white),),
           Icon(Icons.arrow_forward_ios,color: textColor ?? Colors.white,size: 18,),
        ],),
    );
  }
}
