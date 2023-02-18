import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../palette/palette.dart';

class HeaderBack extends StatelessWidget {
  const HeaderBack({Key? key}) : super(key: key);

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
                child: Icon(Icons.arrow_back,size: 40,color: Colors.white,)),
            Icon(Icons.menu_rounded,color: Colors.white,size: 40,)
          ],
        ),
      ),
    );
  }
}
