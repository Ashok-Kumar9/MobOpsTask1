import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Function onPressed;
  final String textOnButton;
  final double width;

  RoundedButton({required this.textOnButton, required this.onPressed, this.width = 200.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 5.0,
        color: Color(0xff209b47),
        borderRadius: BorderRadius.circular(24.0),
        child: MaterialButton(
          onPressed: (){onPressed();},
          minWidth: width,
          child: Text(
            textOnButton,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
