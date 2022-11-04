import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/frame.jpg", fit: BoxFit.fill,
      color: Colors.teal.withOpacity(0.3),
      colorBlendMode: BlendMode.darken,
    );
  }
}
