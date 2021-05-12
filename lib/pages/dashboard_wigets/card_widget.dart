import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidgetButton extends StatelessWidget {
  final String assetImageDirectory;
  final String text;
  final navigateTo;

  const CardWidgetButton({this.assetImageDirectory, this.text,this.navigateTo});
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
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => navigateTo,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetImageDirectory,
              height: 100,
            ),
            Text(
              text,
              style: cardTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
