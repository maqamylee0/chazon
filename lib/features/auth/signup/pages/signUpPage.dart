import 'package:chazon/palette/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var totalHeight = MediaQuery.of(context).size.height;
     var totalWidth = MediaQuery.of(context).size.width;

     return Scaffold(
       backgroundColor: Colors.white,
      body: Container(

        child: Stack(
          children: [
               Container(
                 width: totalWidth,
                 child: Column(
                   children: [
                     Container(
                       height: totalHeight * 0.35,
                       color: Colors.white,
                     ),
                     Expanded(

                       child: Image.asset('background.png',
                         width: totalWidth,
                         fit: BoxFit.cover,
                       ),
                     ),

                   ],
                 ),
               ),
            Container(
              color: Colors.transparent,
              // color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(30, 150, 30, 150),
              child: Container(

                height: totalHeight*0.7,
                width: double.infinity,
                // width: totalWidth*0.6,
                decoration: BoxDecoration(
                    border: Border.all(color: Palette.scaffoldBorder,width: 3),

                  borderRadius: BorderRadius.circular(30),
                  color: Palette.scaffold.withOpacity(0.55),

                ),
                child: Column(
                  children: [
                    Image.asset('logoblu1.png',
                        width: 170,
                        height: 170,

                        // color: Palette.chazonBlue,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
