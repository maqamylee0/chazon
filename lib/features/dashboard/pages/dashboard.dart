import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pageImports.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int pageIndex = 0;

  final pages = [
     HomePage(),
    const CategoryPage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Header(),
        ),
      ),
        bottomNavigationBar:
        Container(
          margin: EdgeInsets.all(10),
          height: 70,
          // padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: BoxDecoration(
              border: Border.all(color: Palette.chazonBlueLess,width: 2),
              borderRadius: BorderRadius.circular(20),
              color: Palette.chazonBlue
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

               Container(

                 height: 70,

                 // margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(16),
                   color: pageIndex == 0 ? Palette.chazonBlueDark : Palette.chazonBlue
                 ),
                 width: MediaQuery.of(context).size.width*0.3,
                 child: IconButton(
                   icon:Icon(Icons.home,color: Colors.white,size: pageIndex == 0 ? 35 : 25,), onPressed: () {
                     setState(() {
                       pageIndex = 0;
                     });
                 },
                 ),
               ),

                 Container(
                   height: 70,
                   width: MediaQuery.of(context).size.width*0.3,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: pageIndex == 1 ? Palette.chazonBlueDark : Palette.chazonBlue

                  ),
                  child: IconButton(
                    // alignment: Alignment.centerRight,
                    icon:Icon(CupertinoIcons.list_bullet,color: Colors.white,
                      size: pageIndex == 1 ? 35 : 25,
                    ), onPressed: () {
                    setState(() {
                      pageIndex =1;
                    });
                  },
                  ),
                ),

            ],
          ),
        ),
     body: pages[pageIndex],
    );
  }
}
