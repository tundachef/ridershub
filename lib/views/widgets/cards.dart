import 'package:flutter/material.dart';

import '../colors.dart';

Container historyOrderCard(double v16, {bool isOrderPage = false}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: REAL_WHITE),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "#0003458538(24#)",
                  style: titleTextStyle.copyWith(fontSize: 17),
                ),
                Text(
                  "14.5 OMR",
                  style:
                      normalTextStyle.copyWith(fontSize: 17, color: APP_GREY),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: v16 / 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Snacks & More - Saada",
                    style:
                        normalTextStyle.copyWith(fontSize: 17, color: APP_GREY),
                  ),
                  isOrderPage
                      ? Container()
                      : Text(
                          "10:53 am",
                          style: normalTextStyle.copyWith(
                              fontSize: 15, color: APP_GREY),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Container pendingOrderCard(double v16) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: REAL_WHITE),
        child: Text(
          "#0003458538(24#)",
          style: titleTextStyle.copyWith(fontSize: 17),
        ),
      ),
    ),
  );
}
