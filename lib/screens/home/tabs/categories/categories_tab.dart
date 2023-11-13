import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../model/categoryDM.dart';
import 'category_widget.dart';
class CategoriesTab extends StatelessWidget {
  Function onCategoryClick;

  CategoriesTab( this.onCategoryClick);
  Widget build(BuildContext context) {
    List<CategoryDM> categories=[
      CategoryDM(id: 'sports', text: AppLocalizations.of(context)!.sports, imagePath: 'assets/sports.png',
          backgroundColor:MyTheme.redColor , isLeftSided: true),
      CategoryDM(id: 'technology', text: AppLocalizations.of(context)!.politics, imagePath: 'assets/Politics.png',
          backgroundColor:MyTheme.blueColor , isLeftSided: false),
      CategoryDM(id: 'health', text: AppLocalizations.of(context)!.health, imagePath: 'assets/health.png',
          backgroundColor:MyTheme.pinkColor , isLeftSided: true),
      CategoryDM(id: 'bussiness', text: AppLocalizations.of(context)!.bussiness, imagePath: 'assets/bussines.png',
          backgroundColor:MyTheme.orangeColor , isLeftSided: false),
      CategoryDM(id: 'entertainment', text: AppLocalizations.of(context)!.environment, imagePath: 'assets/environment.png',
          backgroundColor:MyTheme.babyBlueColor , isLeftSided: true),
      CategoryDM(id: 'sience', text: AppLocalizations.of(context)!.sience, imagePath: 'assets/science.png',
          backgroundColor:MyTheme.yellowColor , isLeftSided: false),
    ];
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
                      onCategoryClick(categories[index]);
                  },
                  child: CategoryWidget(
                      category:categories[index] ),
                ),
                itemCount:categories.length,
            ),
          )
        ],
      ),
    );
  }
}
