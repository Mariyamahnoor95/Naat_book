import 'package:flutter/material.dart';
import 'package:name_country/models/kalaam.dart';
import 'package:name_country/screens/kalaamscreen.dart';
import 'package:name_country/widgets/theme.dart';

class KalamWidget extends StatelessWidget {
  final Kalaam kalaam;
  final int itemNum;

  const KalamWidget({
    super.key,
    required this.kalaam,
    required this.itemNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
       const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
              color:Colors.grey,
              offset: Offset(2.0, 2.0),
              blurRadius: 5
       ),],
          border: Border(
          top:BorderSide(
              color: Colors.black38,
              width: 2.0))),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>KalamScreen(
            kalam: kalaam),
        ),
        ),
        style: ListTileStyle.list,
        trailing: Container(
          margin: const EdgeInsets.all(6.0),
          padding: const EdgeInsets.all(8.0),
          decoration:  BoxDecoration(
            color: MyTheme.greenColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            "$itemNum",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white,),
          ),
        ),
        title: Text(
          kalaam.lines[0],
          textAlign: TextAlign.right,
          textScaleFactor: 1.2,
        ),
        subtitle: Text(kalaam.poet),
      ),
    );
  }
}
