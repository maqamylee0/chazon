import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chazon/features/pageImports.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            padding: EdgeInsets.all(10),
              child: HeaderBack()
          ),

        ),
        body:
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               // SizedBox(height: 20,),
               Text('WALLET',style: TextStyle(color: Palette.textColor),),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('UGX',style: TextStyle(color: Palette.chazonBlue,fontSize: 16),),
                   SizedBox(width: 10,),
                   Text('75,600',style: TextStyle(color: Palette.textColor,fontSize: 32))
                 ],
               ),
               SizedBox(height: 20,),
               Container(
                 // width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Palette.scaffold,
                   border: Border.all(color: Palette.scaffoldBorder,width: 3),
                 ),
                 child:Column(
                   children: [
                     SizedBox(height: 10,),
                     Text('Recent Transactions',style: TextStyle(color: Palette.chazonBlue,fontSize: 14),),
                     Container(
                       padding: EdgeInsets.all(10),
                       height: MediaQuery.of(context).size.height*0.5,

                         child: ListView.builder(
                              itemCount: 4,
                             itemBuilder: (BuildContext context, index){
                           return Container(
                             margin: EdgeInsets.all(5),

                             child: Row(
                               children: [
                                 Container(
                                   width:95,
                                   height: 95,

                                   decoration: BoxDecoration(
                                     borderRadius : BorderRadius.circular(20),
                                     image: DecorationImage(fit: BoxFit.cover,
                                         image: AssetImage('assets/car.jpeg')
                                     ),

                                   ),
                                 ),
                                 Container(
                                   padding: EdgeInsets.all(5),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Wooden Furniture stool',style: TextStyle(fontSize: 13),),
                                       Text('UGX 33,000')
                                     ],
                                   ),
                                 )

                               ],
                             ),
                           );
                         }),
                       ),

                   ],
                 ),
               ),
              SizedBox(height: 40,),
               SizedBox(
                 height: 63,
                 width: 291,
                 child: ElevatedButton(
                     onPressed: (){},
                   style: ButtonStyle(
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20.0),
                               // side: BorderSide(color: Colors.red)
                           )
                       )
                   ),
                     child:Text('TOP UP',style:
                     TextStyle(fontSize: 17,fontWeight:
                     FontWeight.w500,color: Colors.white),)
                 ),
               )


             ],
            ),

        ),
      ),
    );
  }
}
