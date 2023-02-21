import 'package:chazon/features/pageImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>  items =[
      'assets/Vector4.svg',
      'assets/Vector.svg',
      'assets/Vector1.svg',
      'assets/Vector2.svg',
      'assets/Vector4.svg',
      'assets/Vector3.svg',
      'assets/Vector.svg',
      'assets/Vector.svg'];
    List<String>  items2 =[
      'AUTOMOBILES',
      'HOME ACCESSORIES',
      'GADGETS',
      'FURNITURE',
      'FASHION',
      'REAL ESTATE',
      'FASHION',
      'REAL ESTATE'];
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      child:
    GridView.builder(
      // physics: NeverScrollableScrollPhysics(),

      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 50,
        crossAxisSpacing: 50,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            // runMethod(letters[index]);
          },
          child: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Palette.scaffoldBorder,width: 2)
            ),
              // color: Colors.amberAccent,
              child: Center(child: Column(
                // crossAxisAlignment: CrossAxisAlignment.,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(items[index]),
                  SizedBox(height: 10,),
                  Text(items2[index],style: TextStyle(fontSize: 10),)
                ],
              ))),
        );
      },

    ),);
  }
}
