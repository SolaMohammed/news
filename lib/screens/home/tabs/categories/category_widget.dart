import 'package:flutter/material.dart';

import '../../../../model/categoryDM.dart';

class CategoryWidget extends StatelessWidget {
  CategoryDM category;
  CategoryWidget({required this.category});
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius:BorderRadius.only(
          topLeft:Radius.circular(16) ,topRight: Radius.circular(16),
          bottomLeft: category.isLeftSided? Radius.circular(16):Radius.zero,
          bottomRight: category.isLeftSided? Radius.zero: Radius.circular(16),
      )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imagePath,height: MediaQuery.of(context).size.height*.14,),
          SizedBox(height: 4,),
          Text(category.text,style: TextStyle(color: Colors.white,fontSize: 22)),
        ],
      ),
    );
  }
}
