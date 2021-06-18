import 'package:flutter/material.dart';

import '../colors.dart';

Container historyOrderCard(double v16, {bool isOrderPage = false}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [LIGHT_BOXSHADOW],
          color: REAL_WHITE),
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
                style: normalTextStyle.copyWith(fontSize: 17, color: APP_GREY),
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
  );
}

Container orderMoneyCard(
  double v16,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: v16 / 1.5, vertical: v16 / 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [LIGHT_BOXSHADOW],
          color: REAL_WHITE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "#0003458538(24#)",
                style: titleTextStyle.copyWith(fontSize: 16),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/images/cash.png",
                      width: 24,
                    ),
                  ),
                  Text(
                    "14.5 OMR",
                    style:
                        normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: v16 / 2),
            child: Text(
              "Snacks & More - Saada",
              style: normalTextStyle.copyWith(fontSize: 14, color: APP_GREY),
            ),
          )
        ],
      ),
    ),
  );
}

Container historyMoneyCard(
  double v16,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: v16 / 1.5, vertical: v16 / 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [LIGHT_BOXSHADOW],
          color: REAL_WHITE),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "#0003458538(24#)",
                style: titleTextStyle.copyWith(fontSize: 16),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/images/cash.png",
                      width: 24,
                    ),
                  ),
                  Text(
                    "14.5 OMR",
                    style:
                        normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: v16 / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Snacks & More - Saada",
                  style:
                      normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                ),
                Text(
                  "10:53 am",
                  style:
                      normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Container historyCreditCard(
  double v16,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: v16 / 1.5, vertical: v16 / 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [LIGHT_BOXSHADOW],
          color: REAL_WHITE),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "#0003458538(24#)",
                style: titleTextStyle.copyWith(fontSize: 16),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/images/card.png",
                      width: 24,
                    ),
                  ),
                  Text(
                    "Credit Card",
                    style:
                        normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: v16 / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Snacks & More - Saada",
                  style:
                      normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                ),
                Text(
                  "10:53 am",
                  style:
                      normalTextStyle.copyWith(fontSize: 15, color: APP_GREY),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Container pendingOrderCard(double v16) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: v16 / 2, vertical: v16 / 2),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: v16 / 1.5, vertical: v16 / 1.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [LIGHT_BOXSHADOW],
          color: REAL_WHITE),
      child: Text(
        "#0003458538(24#)",
        style: titleTextStyle.copyWith(fontSize: 17),
      ),
    ),
  );
}
