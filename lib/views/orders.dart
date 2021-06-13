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
              padding: EdgeInsets.symmetric(horizontal: v16 / 2),
              child: Text(
                "Assigned Orders",
                style: titleTextStyle,
              ),
            ),
            historyOrderCard(v16, isOrderPage: true),
            historyOrderCard(v16, isOrderPage: true),
            historyOrderCard(v16, isOrderPage: true),
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
}
