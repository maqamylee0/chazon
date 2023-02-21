import 'package:chazon/features/product_detail/pages/expand_product.dart';
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
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          height: 200,
          child: Column(
            children: [
              Row(

                children: [
                  Container(
                    padding:EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: SvgPicture.asset('assets/Vector4.svg',color: Color(0xFF3E4347), height: 20,width: 20,)),
                  //Icon(Icons.car_rental,size: 40,)
                  SizedBox(width: 10,),
                  Text('AUTOMOBILES',style: TextStyle(fontSize: 14),)],
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  ExpandProductPage()),
                          );                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 140,
                            // height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                  image:  DecorationImage(
                                      image: AssetImage("assets/car.jpeg"),
                                      fit: BoxFit.fitHeight),
                                border: Border.all(
                                    color: Palette.scaffoldBorder, width: 2.5)),
                            // color: Colors.amberAccent,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(
                                  height: 75,
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
                                        Text('UGX 190,000,000',style: TextStyle(fontSize: 14,
                                          color: Color(0xFF3E4347),fontWeight: FontWeight.w600
                                        ),)
                                      ],
                                    )
                                )
                              ],
                            )),
                      );
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
