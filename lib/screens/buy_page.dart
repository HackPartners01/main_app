import 'package:flutter/material.dart';

import 'package:main_app/components/circle_image_and_label.dart';
import 'package:main_app/data_models/category.dart';
import 'package:main_app/components/body_section.dart';
import 'package:main_app/data_models/body_section_content.dart';
import 'package:main_app/constants.dart';

class BuyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of category widgets on homepage
    List<CircleImageAndLabel> categoryCardsList = [];

    // ToDo : Fetch the categoryList data from database
    List<Category> categoryList = [
      Category(name: 'Category1', localImageAddress: 'assets/images/Pseudocode.png'),
      Category(name: 'Category2', localImageAddress: 'assets/images/Pseudocode.png'),
      Category(name: 'Category3', localImageAddress: 'assets/images/Pseudocode.png'),
      Category(name: 'Category4', localImageAddress: 'assets/images/Pseudocode.png'),
      Category(name: 'Category5', localImageAddress: 'assets/images/Pseudocode.png'),
    ];

    void categoryCardsListBuilder() {
      categoryCardsList.add(
        CircleImageAndLabel(
          image: AssetImage('assets/images/Pseudocode.png'),
          label: 'All Categories',
          onPress: () {},
        ),
      );
      for (Category category in categoryList) {
        categoryCardsList.add(
          CircleImageAndLabel(
            image: category.localImageAddress != null
                ? AssetImage(category.localImageAddress)
                : NetworkImage(category.networkImageAddress),
            label: category.name,
            onPress: () {
              Navigator.pushNamed(context, '/ProductList');
            },
          ),
        );
      }
    }

    categoryCardsListBuilder();

    // List of Body Section widgets on homepage
    List<BodySection> bodySectionWidgetList = [];

    // ToDo : Fetch the bodySectionList data from database
    List<BodySectionContent> bodySectionContentList = [];

    void bodySectionWidgetListBuilder() {
      for (BodySectionContent b in bodySectionContentList) {
        bodySectionWidgetList.add(BodySection(bodySectionContent: b));
      }
    }

    bodySectionWidgetListBuilder();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Category Bar
        Container(
          height: 100.0,
          decoration: BoxDecoration(color: kColorGreen),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categoryCardsList,
          ),
        ),
        // Body Sections
        Expanded(
          child: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              // TODO : Uncomment the below when body section content list is ready
              // children: bodySectionWidgetList,
              children: <Widget>[
                BodySection(
                  title: 'Deals of the Day',
                  numberOfCards: 1,
                  sectionBackgroundColor: kColorBlue,
                  onPressOfCardChildren: [
                    () {
                      Navigator.pushNamed(context, '/ProductPage');
                    }
                  ],
                ),
                BodySection(
                  title: 'Recommendations : Based on Your Search',
                  numberOfCards: 5,
                  sectionBackgroundColor: kColorGreen,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
