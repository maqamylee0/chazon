import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chazon/features/pageImports.dart';

class Section extends StatelessWidget {
  const Section({Key? key, required this.index}) : super(key: key);
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.scaffold,
      margin: EdgeInsets.all(10),
      height: 250,
      child: Column(
        children: [
          Row(

            children: [Icon(Icons.car_rental,size: 40,),SizedBox(width: 20,),
              Text('AUTOMOBILE')],
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
                                fit: BoxFit.cover),
                          border: Border.all(
                              color: Palette.scaffoldBorder, width: 2)),
                      // color: Colors.amberAccent,
                      child: Center(
                          child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 10,
                          ),
                          Text('subaru')
                        ],
                      )));
                }),
          ),
        ],
      ),
    );
  }
}
