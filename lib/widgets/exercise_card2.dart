import 'package:flutter/material.dart';

import '../constants/constant.dart';

class ExerciseCard2 extends StatefulWidget {
  const ExerciseCard2({
   // required this.imgPath,
    required this.name,
    this.onPress,
    Key? key,
  }) : super(key: key);

  final String name;
//  final String imgPath;
  final VoidCallback? onPress;

  @override
  State<ExerciseCard2> createState() => _ExerciseCard2State();
}

class _ExerciseCard2State extends State<ExerciseCard2> {
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
              SizedBox(
                width: size.width*0.77,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(widget.name,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("complete 2 training days",style: TextStyle(fontSize: 12,color: Colors.grey),),
                        Text("0/2",style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Container(
                      height: 5,
                      width: size.width*0.62,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
