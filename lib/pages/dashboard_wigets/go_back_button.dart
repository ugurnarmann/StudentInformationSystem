import 'package:flutter/material.dart';

class GoBackButton extends StatefulWidget {
  final goBackPage;
  @override
  _GoBackButton createState() => _GoBackButton(goBackPage);
  const GoBackButton({this.goBackPage});
}

class _GoBackButton extends State<GoBackButton> {
  final goBackPage;
  _GoBackButton(this.goBackPage);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => goBackPage,
          ),
        ),
      },
      child: Container(
        alignment: AlignmentDirectional.topEnd,
        child: Icon(
          Icons.arrow_back,
          size: 40,
        ),
      ),
    );
  }
}
