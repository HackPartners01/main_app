import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main_app/components/product_card.dart';
import 'package:main_app/data_models/body_section_content.dart';
import 'package:main_app/constants.dart';
import 'reusable_card.dart';

class BodySection extends StatelessWidget {
  final BodySectionContent bodySectionContent;
  final Color sectionBackgroundColor;
  final Color productBackgroundColor;

  // TODO : Remove below variables and sectionContentBuilder() function once product list is ready
  final String title;
  final int numberOfCards;
  final List<Widget> cardChildren;
  final List<Function> onPressOfCardChildren;

  const BodySection({
    this.bodySectionContent,
    this.sectionBackgroundColor = kColorBlue,
    this.productBackgroundColor = kColorWhite,
    this.title,
    this.numberOfCards,
    this.cardChildren,
    this.onPressOfCardChildren,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> sectionWidgetList = [];

    void sectionWidgetListBuilder() {
      sectionWidgetList.add(
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            bodySectionContent.sectionTitle,
            style: GoogleFonts.openSans(textStyle: kBodySectionTitleTextStyle),
          ),
        ),
      );

      int i;
      for (i = 0;
          i < (bodySectionContent.productList.length / 2).floor() * 2;
          i += 2) {
        sectionWidgetList.add(
          Container(
            constraints: BoxConstraints(maxHeight: 200.0),
            child: Row(
              children: [
                ProductCard(
                  product: bodySectionContent.productList[i],
                  backgroundColor: productBackgroundColor,
                  onPress: () {},
                ),
                ProductCard(
                  product: bodySectionContent.productList[i + 1],
                  backgroundColor: productBackgroundColor,
                  onPress: () {},
                ),
              ],
            ),
          ),
        );
      }
      if (numberOfCards % 2 != 0) {
        sectionWidgetList.add(
          Container(
            constraints: BoxConstraints(maxHeight: 200.0),
            child: Row(
              children: [
                ProductCard(
                  product: bodySectionContent.productList[i],
                  backgroundColor: productBackgroundColor,
                  onPress: () {},
                ),
                ReusableCard(color: Colors.transparent),
              ],
            ),
          ),
        );
      }
    }

    void sectionContentBuilder() {
      sectionWidgetList.add(
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            title,
            style: GoogleFonts.openSans(textStyle: kBodySectionTitleTextStyle),
          ),
        ),
      );

      int i;
      for (i = 0; i < (numberOfCards / 2).floor() * 2; i += 2) {
        sectionWidgetList.add(
          Container(
            constraints: BoxConstraints(maxHeight: 200.0),
            child: Row(
              children: [
                ReusableCard(
                  color: productBackgroundColor,
                  child: cardChildren != null ? cardChildren[i] : null,
                  onPress: onPressOfCardChildren != null
                      ? onPressOfCardChildren[i]
                      : () {},
                ),
                ReusableCard(
                  color: productBackgroundColor,
                  child: cardChildren != null ? cardChildren[i + 1] : null,
                  onPress: onPressOfCardChildren != null
                      ? onPressOfCardChildren[i + 1]
                      : () {},
                ),
              ],
            ),
          ),
        );
      }
      if (numberOfCards % 2 != 0) {
        sectionWidgetList.add(
          Container(
            constraints: BoxConstraints(maxHeight: 200.0),
            child: Row(
              children: [
                ReusableCard(
                  color: productBackgroundColor,
                  child: cardChildren != null ? cardChildren[i] : null,
                  onPress: onPressOfCardChildren != null
                      ? onPressOfCardChildren[i]
                      : () {},
                ),
                ReusableCard(color: Colors.transparent),
              ],
            ),
          ),
        );
      }
    } // Temporary

    bodySectionContent != null
        ? sectionWidgetListBuilder()
        : sectionContentBuilder();

    return Container(
      padding: EdgeInsets.all(5.0),
      color: sectionBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: sectionWidgetList,
      ),
    );
  }
}
