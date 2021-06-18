import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ridershub/views/widgets/app_bars.dart';

import 'colors.dart';
import 'widgets/cards.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      appBar: orderAppBar(width: width, v16: v16, context: context),
      body: Container(
        width: width,
        height: height,
        child: ListView(
          padding: EdgeInsets.only(top: v16),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: v16 / 2, right: v16 / 2),
              child: Row(
                children: <Widget>[
                  Container(
                    width: v16 * 1.8,
                    height: v16 * 1.8,
                    decoration: BoxDecoration(
                      color: APP_BELL,
                      borderRadius: BorderRadius.circular(v16 * 0.9),
                    ),
                    child: Icon(
                      EvaIcons.bellOutline,
                      size: v16 * 1.2,
                      color: REAL_WHITE,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: v16 / 2),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: v16, vertical: v16 / 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: REAL_WHITE,
                          boxShadow: [LIGHT_BOXSHADOW]),
                      child: Text(
                        "New Salalah Zone",
                        style: normalTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // BORDER
            orderBorder(v16),
            Container(
              padding: EdgeInsets.symmetric(horizontal: v16 / 2),
              child: Text(
                "Assigned Orders",
                style: titleTextStyle,
              ),
            ),
            orderMoneyCard(v16),
            orderMoneyCard(v16),
            orderMoneyCard(v16),
            // BORDER
            orderBorder(v16),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
              child: Text(
                "Nearby Pending",
                style: titleTextStyle,
              ),
            ),
            pendingOrderCard(v16),
            pendingOrderCard(v16),
            pendingOrderCard(v16),
          ],
        ),
      ),
    );
  }

  Container orderBorder(double v16) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: v16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2, color: DECENT_GREY)),
      ),
    );
  }
}
