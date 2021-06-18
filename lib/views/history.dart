import 'package:flutter/material.dart';
import 'package:ridershub/views/colors.dart';
import 'package:ridershub/views/widgets/app_bars.dart';

import 'widgets/cards.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: historyAppBar(width: width, v16: v16, context: context),
      body: Container(
        width: width,
        height: height,
        child: ListView(
          children: <Widget>[
            Container(
              width: width,
              height: v16 * 4.5,
              padding: EdgeInsets.symmetric(
                horizontal: 2,
              ),
              margin: EdgeInsets.only(top: v16, bottom: v16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  historyTimeCard(width, title: "DAY", value: "08"),
                  historyTimeCard(width, title: "MONTH", value: "06"),
                  historyTimeCard(width, title: "YEAR", value: "2021"),
                ],
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: v16 / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Today's Orders",
                    style: titleTextStyle.copyWith(fontSize: 17),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: v16 / 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "assets/images/kilometer.png",
                                width: 24,
                              ),
                            ),
                            Text(
                              "46.01 km",
                              style: normalTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.only(r),
                        child: Text(
                          "|",
                          style: titleTextStyle.copyWith(fontSize: 17),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Image.asset(
                                "assets/images/cash.png",
                                width: 24,
                              ),
                            ),
                            Text(
                              "17 OMR",
                              overflow: TextOverflow.ellipsis,
                              style: normalTextStyle.copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            historyMoneyCard(v16),
            historyCreditCard(v16),
            historyMoneyCard(v16),
          ],
        ),
      ),
    );
  }

  Container historyTimeCard(double width,
      {@required String title, @required String value}) {
    return Container(
      width: width / 3.08,
      decoration: BoxDecoration(
        color: APP_PRIMARY,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: normalTextStyle.copyWith(color: REAL_WHITE, fontSize: 12),
            ),
          ),
          Container(
            child: Text(
              value,
              style: titleTextStyle.copyWith(color: REAL_WHITE, fontSize: 17),
            ),
          )
        ],
      )),
    );
  }
}
