import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:name_country/models/kalaam.dart';
import 'package:name_country/widgets/theme.dart';
import '../widgets/KalamWidget.dart';
import '../widgets/routes.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2),);
    final kalaamJson = await rootBundle.loadString("assets/files/kalaam.json"); //load string from kalam json
    final decodedkalaam = jsonDecode(kalaamJson)  ;
    var kalamList = decodedkalaam["kalaam"] as List ;
    KalamCatalog.kalaams =List.from(kalamList).map<Kalaam>((item) => Kalaam.fromJson(item)).toList();

    setState(() {});
  //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 25, ),
        title: const Text(" حمد فہرست ", ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: (KalamCatalog.kalaams!= null && KalamCatalog.kalaams.isNotEmpty)?
        ListView.builder(
          itemCount: KalamCatalog.kalaams.length,
          itemBuilder: (context, int index) {
            return KalamWidget(
              kalaam: KalamCatalog.kalaams[index],
              itemNum: index + 1,
            );
          },
        ):const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer:  Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: MyTheme.greenColor,),
                child: const Text("NOORI NAATAIN", style: TextStyle(color: Colors.white54, ),)),
            ListTile(
              leading: Icon(Icons.star),
                title: const Text("Favorites", style: TextStyle(fontSize: 20),),
            onTap: (() => Navigator.pushNamed(context, MyRoutes.Favorites,))),
            ListTile(
                leading: const Icon(Icons.book),
                title: const Text("Noori Naat Book", style: TextStyle(fontSize: 20),),
                onTap: (() => Navigator.pushNamed(context, MyRoutes.nooriBook,))),

          ],
        ),

      ),

    );
  }
}
