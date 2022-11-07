import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:name_country/models/kalaam.dart';
import 'package:name_country/widgets/theme.dart';
import '../widgets/bd_image.dart';
import 'kalaam_screen.dart';

class NooriNaatPage extends StatefulWidget {
  NooriNaatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NooriNaatPage> createState() => _NooriNaatPageState();
}

class _NooriNaatPageState extends State<NooriNaatPage> {
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    final kalaamJson = await rootBundle
        .loadString("assets/files/kalaam.json"); //load string from kalam json
    final decodedkalaam = jsonDecode(kalaamJson);
    var kalamList = decodedkalaam["kalaam"] as List;
    KalamCatalog.kalaams = List.from(kalamList)
        .map<Kalaam>((item) => Kalaam.fromJson(item))
        .toList();

    setState(() {});
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BgImage(),
          // PageView.builder(
          //   reverse: true,
          //   scrollDirection: Axis.horizontal,
          //   controller: _controller,
          //   itemBuilder: (BuildContext context, index) {
          //     return
          KalamScreen(
            kalam: KalamCatalog.kalaams[0],
            kalaamList: KalamCatalog.kalaams,
          ),
          // );
          //   },
          // )
        ],
      ),
    );
  }
}
