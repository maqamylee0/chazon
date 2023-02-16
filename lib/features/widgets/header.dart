import 'package:chazon/palette/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      child: Container(
        height: 70,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Palette.chazonBlueLess,width: 2),
          borderRadius: BorderRadius.circular(20),
          color: Palette.chazonBlue
        ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             SizedBox(
               height: 43,
             width: 43,
                 child: Image.asset('assets/logoblu1.png')),
             Icon(Icons.menu_rounded,color: Colors.white,size: 40,)
           ],
         ),
      ),
    );
  }
}
