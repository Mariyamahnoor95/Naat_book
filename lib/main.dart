
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:name_country/screens/favorites.dart';
import 'package:name_country/screens/pageview_kalam.dart';
import 'package:name_country/widgets/routes.dart';

import 'package:name_country/screens/homepage.dart';
import 'package:name_country/screens/kalaamscreen.dart';
import 'package:name_country/screens/listscreen.dart';
import 'package:name_country/widgets/theme.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Noori Naat",
      themeMode: ThemeMode.light,

      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homePage,
      routes: {
        MyRoutes.homePage:(context)=>const MyHomePage(),
        // MyRoutes.listPage:(context)=>const ListScreen(),
        MyRoutes.Favorites:(context)=> const Favorites(),
        MyRoutes.nooriBook:(context)=>  NooriNaatPage(),

      },
    );
  }
}
