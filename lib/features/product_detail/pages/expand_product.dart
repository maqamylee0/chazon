import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:chazon/features/pageImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class ExpandProductPage extends StatefulWidget {
   ExpandProductPage({Key? key}) : super(key: key);

  @override
  State<ExpandProductPage> createState() => _ExpandProductPageState();
}

class _ExpandProductPageState extends State<ExpandProductPage> {
  // final CarouselController _controller = CarouselController();
  late PageController _controller ;

   int _current = 0;
   List<String>  imgList = [
     'assets/Vector.png','assets/Vector1.png','assets/Vector2.png','assets/Vector5.png'
   ];
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.4,
            width:MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/car.jpeg'),fit: BoxFit.cover,

                )
            ),



          ),
          Positioned(
            bottom: 10.0,
            right: 20.0,
            child: Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,

                  ),
                  // padding: EdgeInsets.all(3),
                  height: 30,
                    width: 30,
                ),
                Positioned(
                    top:-5,
        child: Icon(CupertinoIcons.arrow_turn_left_down,color: Colors.black,size: 30,)),

              ],
            ),
          ),
        ],
      )))

        .toList();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(padding: EdgeInsets.all(10),
              child: HeaderBack()),

        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                  SizedBox(
                    height: 250,
                      child: PageView(
                        children: imageSliders,
                        controller: _controller,
                      ),
                    ),

                  SizedBox(height: 10,),
                  ScrollingPageIndicator(
                    dotColor: Colors.grey,
                    dotSelectedColor: Palette.chazonBlue,
                    dotSize: 8,
                    dotSelectedSize: 10,
                    dotSpacing: 12,
                    controller: _controller,
                    itemCount: imgList.length,
                    orientation: Axis.horizontal,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration:  BoxDecoration(
                      color: Palette.scaffold,
                        borderRadius: BorderRadius.circular(20),

                    ),

                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                        Text('2020 MUSTANG',style: TextStyle(fontSize: 10),),
                        Text('UGX 190,000,000',style: TextStyle(fontSize:15,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text('2020 MUSTANG UGX 190,000,000 This 2020 Mustang is the epitome of American muscle. With a sleek and aerodynamic design, this car is sure to turn heads on the road.'
                            ' The 5.0L V8 engine produces a whopping 450 horsepower, '
                            'making it a thrill to drive. The interior is well-appointed with'
                            ' premium materials and state-of-the-art technology, including a large touchscreen display and '
                            'advanced safety features. Don\'t miss out on the '
                            'opportunity to own this iconic car. Order now on Chazon.',style: TextStyle(fontSize: 12),),

                      ]

                    ),
                  ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                           Container(
                             height: 50,
                             width:170,
                             padding: EdgeInsets.all(5),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(15),
                                 color: Palette.scaffold
                             ),
                             child: Row(
                               children: [
                                 SvgPicture.asset('assets/glasses.svg'),SizedBox(width: 5,),
                                 Text('View in VR or AR',style: TextStyle(fontSize: 12),)
                               ],
                             ),
                           ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WalletPage()),
                          );
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                height: 50,
                                width: 136,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  color: Palette.chazonBlue
                          ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          'assets/buy4.png',height: 20,width: 20,),
                                      SizedBox(width: 10,),
                                      Text('Purchase',style: TextStyle(color: Colors.white),)

                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
                ],
                // SizedBox(height: 10,),
                // SizedBox(
                //   height: 250,
                //
                //     child: CarouselSlider(
                //       items: imageSliders,
                //       carouselController: _controller,
                //       options: CarouselOptions(
                //
                //           autoPlay: false,
                //           enlargeCenterPage: true,
                //           aspectRatio: 4.0,
                //           onPageChanged: (index, reason) {
                //             setState(() {
                //               _current = index;
                //             });
                //           }),
                //     ),
                //   ),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: imgList.asMap().entries.map((entry) {
                //     return GestureDetector(
                //       onTap: () => _controller.animateToPage(entry.key),
                //       child: Container(
                //         width: 12.0,
                //         height: 12.0,
                //         margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: (Theme.of(context).brightness == Brightness.dark
                //                 ? Colors.white
                //                 : Colors.black)
                //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                //       ),
                //     );
                //   }).toList(),
                // ),

            ),

          ),
        ),

      ),
    );
  }

}
