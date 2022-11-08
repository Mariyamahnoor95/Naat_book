import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KalamLine extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  const KalamLine({
    Key? key,
    required this.color,
    required this.height,
    required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      color: color,
      height: (height == null) ? 50 : height,
      child: (text != null)?
      Container(
        child:AutoSizeText(
          text,
          style:  TextStyle(
          fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor
          ),
        textAlign: TextAlign.center,) ,
      ): null
    );
  }
}
