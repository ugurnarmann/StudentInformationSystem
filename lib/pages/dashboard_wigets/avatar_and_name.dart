import 'package:flutter/material.dart';
import 'exit_button.dart';

class AvatarAndName extends StatelessWidget {
  final String networkImageUrl;
  final String name;
  final String title;
  final headerRightButton;
  AvatarAndName({this.networkImageUrl, this.name, this.title,this.headerRightButton});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              networkImageUrl,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'Montserrat Medium',
                  fontSize: 20,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat Regular',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: headerRightButton,
            ),
          )
        ],
      ),
    );
  }
}
