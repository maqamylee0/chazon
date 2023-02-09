import 'package:chazon/palette/palette.dart';
import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/login.dart';
import '../widgets/signup.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int cupertinoTabBarIValue = 1;
  int cupertinoTabBarIValueGetter() => cupertinoTabBarIValue;
  @override
  Widget build(BuildContext context) {
     var totalHeight = MediaQuery.of(context).size.height;
     var totalWidth = MediaQuery.of(context).size.width;

     return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
        child: Container(
          height: totalHeight,

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

                         child: Image.asset('assets/background.png',
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
                padding: EdgeInsets.fromLTRB(30, 120, 30, 100),
                child: Container(

                  height: totalHeight*0.8,
                  width: double.infinity,
                  // width: totalWidth*0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.scaffoldBorder,width: 3),

                    borderRadius: BorderRadius.circular(30),
                    color: Palette.scaffold.withOpacity(0.55),

                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/logoblu1.png',
                          width: 170,
                          height: 150,

                          // color: Palette.chazonBlue,
                      ),



                    Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // border: Border.all(color: Palette.chazonBlueLess)
                            ),
                          height: 30,
                          // width: totalWidth * 0.7,
                          child: CupertinoTabBar.CupertinoTabBar(

                            const Color(0xffffffff),
                            const Color(0xFF132E6A),
                            [
                              TextButton(
                               onPressed: () {
                                 setState(() {
                                   cupertinoTabBarIValue = 0;

                                 });
                               },
                               child:Text( " SIGN UP ",
                                style: TextStyle(
                                  color: cupertinoTabBarIValue == 0 ? Colors.white :Colors.grey,
                                  fontSize: cupertinoTabBarIValue == 0 ? 5.0 * 2 : 12.0,
                                  fontWeight: FontWeight.w400,
                                  // fontFamily: "SFProRounded",
                                ),
                                textAlign: TextAlign.center,
                              ),),
                               TextButton(
                               onPressed: () {
                                 setState(() {
                                   cupertinoTabBarIValue = 1;

                                 });
                               },
                               child:Text( " LOG IN",
                                style: TextStyle(
                                  color: cupertinoTabBarIValue == 1 ? Colors.white :Colors.grey,
                                  fontSize: cupertinoTabBarIValue == 1 ? 5.0 * 2 : 12.0,
                                  fontWeight: FontWeight.w400,
                                  // fontFamily: "SFProRounded",
                                ),)

                              ),

                            ],
                            // allowScrollable: true,


                            cupertinoTabBarIValueGetter,
                                (int index) {
                              setState(() {
                                // print('jiiii $index');
                                cupertinoTabBarIValue = index;
                              });
                            },
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.all(10),
                          child: cupertinoTabBarIValue == 0 ? SignUpTemplate():LoginTemplate())

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
