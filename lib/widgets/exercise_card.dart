import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../generated/l10n.dart';

class ExerciseCard extends StatefulWidget {
  const ExerciseCard({
   // required this.imgPath,
    required this.name,
     this.onPress,
    Key? key,
  }) : super(key: key);

  final String name;
//  final String imgPath;
  final VoidCallback? onPress;

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return GestureDetector(
      onTap: widget.onPress,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          height: size.height*0.1,
          width: size.width,
          decoration: BoxDecoration(
            color: kDarkGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.all(5),
                  //   height: size.height,
                  //   width: size.width*0.14,
                  //   decoration: BoxDecoration(
                  //     gradient: const LinearGradient(colors: [
                  //       Colors.black,
                  //       kGreyColor,
                  //     ],
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //
                  //     ),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Center(
                  //     child: Stack(
                  //       alignment: Alignment.center,
                  //       children: [
                  //         Container(
                  //           width: size.width,
                  //           height: size.height,
                  //           decoration: BoxDecoration(
                  //               color: Colors.transparent,
                  //               shape: BoxShape.circle,
                  //               border: Border.all(color: kGreyColor,width: 5)
                  //           ),
                  //         ),
                  //         SizedBox(
                  //             width: size.width,
                  //             height: size.height,
                  //             child:  Image(image: AssetImage(widget.imgPath),)),
                  //       ],),
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(widget.name,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                       Text(S.of(context).available,style: TextStyle(fontSize: 12,color: Colors.grey),),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,),
            ],
          ),
        ),
      ),
    );
  }
}
