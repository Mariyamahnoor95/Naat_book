import 'package:flutter/material.dart';
import 'package:name_country/widgets/sections.dart';
import 'package:name_country/widgets/bd_image.dart';

import '../widgets/routes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: const [
          BgImage(),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 170),
              child: Sections(),
            ),
          ),
        ],
      ),
    );
  }
}
