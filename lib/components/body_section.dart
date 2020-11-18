import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main_app/constants.dart';
import 'reusable_card.dart';

class BodySection extends StatelessWidget {
  final String title;
  final int numberOfCards;
  final Color color;
  final List<Widget> cardChildren;
  final List<Function> onPressOfCardChildren;

  const BodySection({
    @required this.title,
    @required this.numberOfCards,
    this.color = kColorBlue,
    this.cardChildren,
    this.onPressOfCardChildren,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> sectionContent = [];

    sectionContent.add(
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
      sectionContent.add(
        Container(
          constraints: BoxConstraints(maxHeight: 200.0),
          child: Row(
            children: [
              ReusableCard(
                color: kColorWhite,
                child: cardChildren != null ? cardChildren[i] : null,
                onPress: () {
                  onPressOfCardChildren != null
                      ? onPressOfCardChildren[i]
                      : null;
                },
              ),
              ReusableCard(
                color: kColorWhite,
                child: cardChildren != null ? cardChildren[i + 1] : null,
                onPress: () {
                  onPressOfCardChildren != null
                      ? onPressOfCardChildren[i + 1]
                      : null;
                },
              ),
            ],
          ),
        ),
      );
    }
    if (numberOfCards % 2 != 0) {
      sectionContent.add(
        Container(
          constraints: BoxConstraints(maxHeight: 200.0),
          child: Row(
            children: [
              ReusableCard(
                color: kColorWhite,
                child: cardChildren != null ? cardChildren[i] : null,
                onPress: () {
                  onPressOfCardChildren != null
                      ? onPressOfCardChildren[i]
                      : null;
                },
              ),
              ReusableCard(color: Colors.transparent),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(5.0),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: sectionContent,
      ),
    );
  }
}
