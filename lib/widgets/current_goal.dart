import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';
import '../generated/l10n.dart';

class CurrentGoal extends StatelessWidget {
  const CurrentGoal({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        decoration: BoxDecoration(
            color: kDarkGreyColor, borderRadius: BorderRadius.circular(20)),
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).currentGoal,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: size.height * 0.025),
                  ),
                  Row(
                    children: [
                      Text(
                        "Front Clamp",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: size.height * 0.017),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "Finished training days 0/2 ",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12),
              ),
              const SizedBox(height:8,),
              Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      value: 0.0,
                      color: Colors.red,
                      backgroundColor: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
