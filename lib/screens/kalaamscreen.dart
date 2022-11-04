import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:name_country/widgets/bd_image.dart';
import '../models/kalaam.dart';
import '../widgets/kalam_line.dart';



class KalamScreen extends StatefulWidget {
 KalamScreen({Key? key, required this.kalam, }) : super(key: key);
  final Kalaam kalam;

  @override
  State<KalamScreen> createState() => _KalamScreenState();
}

class _KalamScreenState extends State<KalamScreen> {
final List<Kalaam> _favKalam =[];

  @override
  Widget build(BuildContext context) {
    final _alreadyfav = _favKalam.contains(widget.kalam);
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
          elevation: 0.0,
          title: Text(widget.kalam.type,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              // color: kTextPrimaryColor
            ),
            textAlign: TextAlign.start,),
        actions: [IconButton(
            onPressed:(){
              setState((){
                if(_alreadyfav){
                  _favKalam.remove(widget.kalam);
                }else{
                  _favKalam.add(widget.kalam);
                }
              });
            },
            icon: Icon(_alreadyfav?Icons.star:Icons.star_border,
                color: _alreadyfav? Colors.red: null))],
      ),
      body: Column(

        children: [

          _buildKalamHeading(widget.kalam.type, widget.kalam.subject, widget.kalam.poet),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.kalam.lines.length,
                  itemBuilder: (BuildContext context, index) {
                    return KalamLine(
                      height: 32,
                      text: widget.kalam.lines[index],
                      color: Colors.transparent,
                    );
                  }))
        ],
      ),
    );
  }
}




Widget _buildKalamHeading(String type, String subject, String poet) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        AutoSizeText(
          subject,
          style: const TextStyle(fontSize: 24, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        AutoSizeText(
          poet,
          style: const TextStyle(fontSize: 16, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16.0,
        )
      ],
    ),
  );
}


