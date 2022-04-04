import 'package:flutter/material.dart';

class MainRoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final double round;
  final double textSize;
  final bool isActive;
  final TextStyle textStyle;
  final double padding;
  final double paddingVert;
  final VoidCallback callback;

  MainRoundedButton(
      {required this.text,
      this.color = Colors.white,
      required this.callback,
      this.round = 6,
      this.isActive = true,
      this.textSize = 15,
      this.padding = 5,
      this.paddingVert = 10,
      this.textStyle = const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15)});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(round)),
      child: Material(
        color: color,
        child: InkWell(
          onTap: callback,
          hoverColor: color,
          focusColor: color,
          highlightColor: color,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1, //
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(round),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: padding, vertical: paddingVert),
              child: Center(
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
