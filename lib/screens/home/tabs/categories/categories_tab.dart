import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/home/my_theme.dart';

import '../../../../model/categoryDM.dart';
import 'category_widget.dart';
class CategoriesTab extends StatelessWidget {
  Function onCategoryClick;

  CategoriesTab( this.onCategoryClick);
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 8,),
          Text("Pick your category\nof interest",textAlign: TextAlign.start,
          style: TextStyle(color: MyTheme.darkGrayColor,fontSize: 22,fontWeight: FontWeight.bold)),
          SizedBox(height: 8,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.1
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                      onCategoryClick(CategoryDM.categories[index]);
                  },
                  child: CategoryWidget(
                      category:CategoryDM.categories[index] ),
                ),
                itemCount:CategoryDM.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
