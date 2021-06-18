import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ridershub/views/colors.dart';
import 'package:ridershub/views/widgets/app_bars.dart';
import 'dart:math';

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
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: false,
              ),
              header: Container(
                decoration: BoxDecoration(
                    boxShadow: [LIGHT_BOXSHADOW],
                    color: REAL_WHITE,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExpandableIcon(
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.arrow_drop_up,
                          collapseIcon: Icons.arrow_drop_down,
                          iconColor: APP_PRIMARY,
                          iconSize: 28.0,
                          iconRotationAngle: pi / 2,
                          iconPadding: EdgeInsets.only(right: 5),
                          hasIcon: false,
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Hashim Al-Haddidi",
                                style: normalTextStyle.copyWith(fontSize: 15),
                              ),
                            ),
                            Container(
                              child: Text(
                                "#0003458538(24#)",
                                style: normalTextStyle.copyWith(
                                    fontSize: 12, color: APP_GREY),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          "Request Location",
                          style: normalTextStyle.copyWith(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              collapsed: Container(),
              expanded: Container(
                width: double.maxFinite,
                height: height / 4,
                decoration: BoxDecoration(
                    color: REAL_WHITE,
                    border: Border.all(color: DECENT_GREY, width: 1),
                    boxShadow: [
                      BoxShadow(
                          color: REAL_BLACK.withOpacity(0.5),
                          offset: Offset(2, 2),
                          spreadRadius: 1,
                          blurRadius: 4)
                    ]),
                child: Text("_"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
