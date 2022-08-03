import 'package:flutter/material.dart';
import 'package:kegel_training/constants/constant.dart';

import '../generated/l10n.dart';

class RatingView extends StatefulWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  _RatingViewState createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {

  int rating=0;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      height: size.height*0.31,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(
              width: size.width*0.2,
              child: const Image(image: const AssetImage("assets/icons/trembling2.png"),),
            ),
             Text(S.of(context).enjoyingApp,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            const SizedBox(height: 10),
             Text(S.of(context).ratingDesc,style: TextStyle(fontSize: 12),),
            const SizedBox(height: 10),
            const Divider(color: Colors.white,height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => IconButton (
                    icon:   Icon(index <rating ? Icons.star : Icons.star_border,
                      size: 30,
                      color: kRedColor,
                    ),
                    onPressed: () {
                     setState(() {
                       rating=index+1;
                     });
                    },
                  ),
              ),
            ),
            const Divider(color: Colors.white,height: 2,),
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);

                },
              child: SizedBox(
                  height: 40,
                  width: size.width*0.8,
                  child:  Center(child: Text(S.of(context).notNow))),
                ),

          ],
        ),
      ),
    );
  }
}
