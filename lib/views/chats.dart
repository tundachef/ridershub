import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ridershub/views/widgets/app_bars.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: chatAppBar(width: width, v16: v16, context: context),
      body: Container(
        width: width,
        height: height,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: v16, horizontal: v16),
          children: <Widget>[
            //
            ExpandablePanel(
              header: Text("cow"),
              // collapsed: Text(
              //   "Cows are awesome",
              //   softWrap: true,
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              // ),
              expanded: Text(
                "Cows are awesome",
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
