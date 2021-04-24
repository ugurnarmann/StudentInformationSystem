import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final String assetImageDirectory;
  final String text;
  CardWidget({this.assetImageDirectory, this.text});
  @override
  Widget build(BuildContext context) {
    var cardTextStyle = TextStyle(
      fontFamily: 'Montserrat Medium',
      fontSize: 14,
      color: Color.fromARGB(80, 80, 80, 1),
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetImageDirectory,
            height: 128,
          ),
          Text(
            text,
            style: cardTextStyle,
          )
        ],
      ),
    );
  }
}
