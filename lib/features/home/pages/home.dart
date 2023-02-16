import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pageImports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
          itemBuilder: (BuildContext context,index){
        return Section( index: index);
      }),
    );


  }
}
