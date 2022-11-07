import 'package:flutter/material.dart';
import 'package:name_country/models/kalaam.dart';
import 'package:name_country/screens/kalaam_screen.dart';
import 'package:name_country/widgets/theme.dart';

class KalamWidget extends StatelessWidget {
  final Kalaam kalaam;
  final List<Kalaam> kalaamList;
  final int itemNum;

  const KalamWidget({
    super.key,
    required this.kalaam,
    required this.itemNum,
    required this.kalaamList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KalamScreen(
              kalam: kalaam,
              kalaamList: kalaamList,
            ),
          ),
        ),
        style: ListTileStyle.list,
        trailing: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: MyTheme.greenColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            "$itemNum",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          kalaam.lines[0],
          style: TextStyle(color: Theme.of(context).primaryColor),
          textAlign: TextAlign.right,
          textScaleFactor: 1.2,
        ),
        subtitle: Text(
          kalaam.poet,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
