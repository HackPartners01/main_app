import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main_app/constants.dart';

class CircleImageAndLabel extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final Function onPress;

  const CircleImageAndLabel(
      {@required this.image, @required this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: 100,
          padding: EdgeInsets.fromLTRB(7.0, 7.0, 7.0, 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 68.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: image),
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  label.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      textStyle: kCircleImageAndLabelTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
