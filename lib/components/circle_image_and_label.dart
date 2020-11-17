import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: image),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                label.toUpperCase(),
                textAlign: TextAlign.center,
                style: kCircleImageAndLabelTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
