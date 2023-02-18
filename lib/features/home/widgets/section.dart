import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chazon/features/pageImports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Section extends StatelessWidget {
  const Section({Key? key, required this.index}) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container(

          color: Palette.scaffold,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          height: 250,
          child: Column(
            children: [
              Row(

                children: [
                  SvgPicture.asset('Vector4.svg',color: Color(0xFF3E4347), height: 30,width: 30,),
                  //Icon(Icons.car_rental,size: 40,)
                  SizedBox(width: 20,),
                  Text('AUTOMOBILES')],
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 145,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                image:  DecorationImage(
                                    image: AssetImage("car.jpeg"),
                                    fit: BoxFit.fitHeight),
                              border: Border.all(
                                  color: Palette.scaffoldBorder, width: 2.5)),
                          // color: Colors.amberAccent,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(
                                height: 105,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                  width: 145,
                                  height: 140/2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),

                                    gradient:

                                    const LinearGradient(

                                    begin: Alignment.bottomRight,
                                      end: Alignment.topRight,
                                      colors: [
                                        Colors.white,
                                        // Colors.white70,
                                        Colors.white70,
                                        Colors.transparent
                                      ]

                                  )
                                ),
                                  child: Column(

                                    children: [
                                      SizedBox(height: 30,),
                                      Text('2022 MUSTANG',),
                                      Text('UGX 190,000,000',style: TextStyle(fontSize: 16,
                                        color: Color(0xFF3E4347),fontWeight: FontWeight.w600
                                      ),)
                                    ],
                                  )
                              )
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ),
        // Positioned(
        //   right: 10,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width*0.23,
        //     height: 270,
        //     decoration: const BoxDecoration(
        //
        //         gradient:
        //
        //         LinearGradient(
        //             // focal: Alignment(0.7, -0.7),
        //              begin: Alignment.topLeft,
        //             end:Alignment.bottomRight ,
        //             // radius: 13.0,
        //                 stops: [
        //                   0.1,0.1,0.4,0.4
        //                 ],
        //             colors: [
        //               // Colors.white,
        //               // Colors.white70,
        //               // Colors.white70,
        //
        //
        //
        //               Colors.transparent,
        //
        //               Colors.transparent,
        //               Colors.white70,
        //               Colors.white70,
        //
        //
        //
        //             ]
        //
        //         )
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
