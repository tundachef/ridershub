import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridershub/views/widgets/statusMap.dart';

import 'colors.dart';
import 'widgets/statusAppBar.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: statusAppBar(width: width, v16: v16, context: context),
      body: Container(
        width: width,
        height: height,
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CupertinoActivityIndicator();
            }
            return StatusMap();
          },
        ),
      ),
    );
  }
}
