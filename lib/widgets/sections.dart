import 'package:flutter/material.dart';
import 'package:name_country/screens/listscreen.dart';
import 'package:name_country/widgets/routes.dart';
import 'package:name_country/widgets/theme.dart';


class Sections extends StatefulWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  State<Sections> createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['حمد', 'نعت', 'منقبت','سلام','مناجات'];
    return ListView.separated(
        padding: const EdgeInsets.all(8),
      itemCount: 5,
        itemBuilder: (BuildContext context , index){
      return GestureDetector(
        onTap:  (() => Navigator.push(context,
            MaterialPageRoute(builder: (context)=>ListScreen(listTitle: entries[index],)) )),

        child: Center(
          child: Container(
            alignment: AlignmentDirectional.bottomCenter,
            height: 50,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.2), color: MyTheme.greenColor,),


            child: Center(child: Text(' ${entries[index]} ',style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold, fontSize: 20),)),
          ),
        ),
      );
    },
      separatorBuilder: (BuildContext context, int index) => const Divider(),);
  }
}
