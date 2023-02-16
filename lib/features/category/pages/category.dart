import 'package:chazon/features/pageImports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String>  items =[
      'assets/Vector.png',
      'assets/Vector1.png',
      'assets/Vector2.png',
      'assets/Vector3.png',
      'assets/Vector4.png',
      'assets/Vector5.png',
      'assets/Vector.png',
      'assets/Vector.png'];
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
                  Image.asset(items[index]),
                  SizedBox(height: 10,),
                  Text(items2[index])
                ],
              ))),
        );
      },

    ),);
  }
}
