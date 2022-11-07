import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
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

  print(_favKalam) {
    // TODO: implement print
    throw UnimplementedError();
  }

  @override
  void initState() {
    _alreadyfav = _favKalam.contains(widget.kalam);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      reverse: true,
      scrollDirection: Axis.horizontal,
      controller: _controller,
      itemBuilder: (BuildContext context, index) {
        var kalaamListItem = widget.kalaamList[index];
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              kalaamListItem.type,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,

                // color: kTextPrimaryColor
              ),
              textAlign: TextAlign.start,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_alreadyfav) {
                      _favKalam.remove(kalaamListItem);
                    } else {
                      _favKalam.add(kalaamListItem);
                    }
                  });
                },
                icon: Icon(
                  _alreadyfav ? Icons.star : Icons.star_border,
                  color: _alreadyfav ? Colors.red : null,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              _buildKalamHeading(
                kalaamListItem.type,
                kalaamListItem.subject,
                kalaamListItem.poet,
                context,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: kalaamListItem.lines.length,
                  itemBuilder: (BuildContext context, kalamLineIndex) {
                    return KalamLine(
                      height: 35,
                      text: kalaamListItem.lines[kalamLineIndex],
                      color: Colors.transparent,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    /*return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          widget.kalam.type,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,

            // color: kTextPrimaryColor
          ),
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (_alreadyfav) {
                    _favKalam.remove(widget.kalam);
                  } else {
                    _favKalam.add(widget.kalam);
                  }
                });
              },
              icon: Icon(_alreadyfav ? Icons.star : Icons.star_border,
                  color: _alreadyfav ? Colors.red : null))
        ],
      ),
      body: Column(
        children: [
          _buildKalamHeading(widget.kalam.type, widget.kalam.subject,
              widget.kalam.poet, context),
          Expanded(
              child: ListView.builder(
                  itemCount: widget.kalam.lines.length,
                  itemBuilder: (BuildContext context, index) {
                    return KalamLine(
                      height: 35,
                      text: widget.kalam.lines[index],
                      color: Colors.transparent,
                    );
                  }))
        ],
      ),
    );*/
  }
}

Widget _buildKalamHeading(
    String type, String subject, String poet, BuildContext context) {
  return Container(
    color: Colors.transparent,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AutoSizeText(
          subject,
          style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        AutoSizeText(
          poet,
          style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16.0,
        )
      ],
    ),
  );
}
