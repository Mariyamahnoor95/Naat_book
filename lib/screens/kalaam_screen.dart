import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:name_country/widgets/bd_image.dart';
import '../models/kalaam.dart';
import '../widgets/kalam_line.dart';
import 'package:name_country/widgets/theme.dart';

class KalamScreen extends StatefulWidget {
  KalamScreen({
    Key? key,
    required this.kalam,
    required this.kalaamList,
  }) : super(key: key);
  final Kalaam kalam;
  final List<Kalaam> kalaamList;

  @override
  State<KalamScreen> createState() => _KalamScreenState();
}

class _KalamScreenState extends State<KalamScreen> {
  final List<Kalaam> _favKalam = [];
  bool _alreadyfav = false;
  PageController _controller = PageController();

  // print(_favKalam) {
  //   // TODO: implement print
  //   throw UnimplementedError();
  // }

  @override
  Widget build(BuildContext context) {
    var kalaamItem = widget.kalam;
    // var kalaamListItem = widget.kalaamList[index];
    _alreadyfav = _favKalam.contains(widget.kalam);
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //
      //   title: Text(
      //       kalaamItem.type,
      //     style: const TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 28,
      //
      //
      //       // color: kTextPrimaryColor
      //     ),
      //     textAlign: TextAlign.start,
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           setState(() {
      //             if (_alreadyfav) {
      //               _favKalam.remove(kalaamItem);
      //             } else {
      //               _favKalam.add(kalaamItem);
      //             }
      //           });
      //         },
      //         icon: Icon(_alreadyfav ? Icons.star : Icons.star_border,
      //             color: _alreadyfav ? Colors.red : null))
      //   ],
      // ),
      body: Container(
        child: SafeArea(
          child: Stack(
              fit: StackFit.expand,
            children: [
              Column(
                children: [

                  _buildKalamHeading(kalaamItem.type, kalaamItem.subject,
                      kalaamItem.poet, context),

                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 12.0),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(width: 10.0, color: Color(0xFF006064)),
                              right: BorderSide(width: 10.0, color: Color(0xFF006064))),),
                        child: ListView.builder(
                            itemCount: kalaamItem.lines.length,
                            itemBuilder: (BuildContext context, index) {
                              return KalamLine(
                                height: 40,
                                text: kalaamItem.lines[index],
                                color: Colors.transparent,
                              );
                            },
    ),
                      ),
    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
  }


Widget _title_Background(BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: BoxDecoration(

        image: DecorationImage(
        colorFilter: ColorFilter.mode( Color(0xFF006064).withOpacity(0.9), BlendMode.color),
        fit: BoxFit.fill,image: AssetImage("assets/images/title_frame4.jpg"))),
  );
}

Widget _buildKalamHeading(
    String type, String subject, String poet, BuildContext context) {
  return Stack(
    children: [
      _title_Background(context),
      Container(
        padding: EdgeInsets.only(top: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            AutoSizeText(
              type +" "+ subject,
              style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.greenColor,),
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              poet,
              style: TextStyle(fontSize: 16,color: MyTheme.greenColor,),
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
    ],
  );
}

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0.0,
//         title: Text(
//           kalaamItem.type,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 28,
//
//             // color: kTextPrimaryColor
//           ),
//           textAlign: TextAlign.start,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 if (_alreadyfav) {
//                   _favKalam.remove(kalaamItem);
//                 } else {
//                   _favKalam.add(kalaamItem);
//                 }
//               });
//             },
//             icon: Icon(
//               _alreadyfav ? Icons.star : Icons.star_border,
//               color: _alreadyfav ? Colors.red : null,
//             ),
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           _buildKalamHeading(
//             kalaamItem.type,
//             kalaamItem.subject,
//             kalaamItem.poet,
//             context,
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: kalaamItem.lines.length,
//               itemBuilder: (BuildContext context, kalamLineIndex) {
//                 return KalamLine(
//                   height: 35,
//                   text: kalaamItem.lines[kalamLineIndex],
//                   color: Colors.transparent,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   },
// );