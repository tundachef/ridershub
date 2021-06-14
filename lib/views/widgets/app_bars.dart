import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

PreferredSize statusAppBar(
    {@required double width,
    @required double v16,
    @required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size(width, 56),
    child: Material(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(color: REAL_WHITE),
        padding: EdgeInsets.only(
            top: v16 * 1.5, left: v16 / 2, right: v16 / 2, bottom: v16 * 0.75),
        width: width,
        child: Theme(
          data: Theme.of(context).copyWith(primaryColor: APP_PRIMARY),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 24,
                    color: APP_GREY,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: v16 / 2),
                    child: Text(
                      "STATUS MAP",
                      style: titleTextStyle.copyWith(
                          fontSize: 17, color: APP_GREY),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Looking for orders",
                      style: normalTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Online",
                            style: normalTextStyle.copyWith(
                                color: APP_GREY, fontSize: 15),
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: APP_GREEN,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSize historyAppBar(
    {@required double width,
    @required double v16,
    @required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size(width, 56),
    child: Material(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(color: REAL_WHITE),
        padding: EdgeInsets.only(
            top: v16 * 2.25, left: v16 / 2, right: v16 / 2, bottom: v16 * 0.75),
        width: width,
        child: Theme(
          data: Theme.of(context).copyWith(primaryColor: APP_PRIMARY),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 24,
                    color: APP_GREY,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: v16 / 2),
                    child: Text(
                      "HISTORY",
                      style: titleTextStyle.copyWith(
                          fontSize: 17, color: APP_GREY),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: v16 / 2),
                    child: Icon(
                      EvaIcons.arrowCircleLeftOutline,
                      size: 24,
                      color: APP_PRIMARY,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: v16),
                    child: Icon(
                      EvaIcons.arrowCircleRightOutline,
                      size: 24,
                      color: APP_PRIMARY,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: v16 / 2),
                    child: Icon(
                      EvaIcons.calendarOutline,
                      size: 28,
                      color: APP_PRIMARY,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSize orderAppBar(
    {@required double width,
    @required double v16,
    @required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size(width, 56),
    child: Material(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(color: REAL_WHITE),
        padding: EdgeInsets.only(
            top: v16 * 1.5, left: v16 / 2, right: v16 / 2, bottom: v16 * 0.75),
        width: width,
        child: Theme(
          data: Theme.of(context).copyWith(primaryColor: APP_PRIMARY),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 24,
                    color: APP_GREY,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: v16 / 2),
                    child: Text(
                      "ORDERS",
                      style: titleTextStyle.copyWith(
                          fontSize: 17, color: APP_GREY),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Found Order",
                      style: normalTextStyle.copyWith(fontSize: 15),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Online",
                            style: normalTextStyle.copyWith(
                                color: APP_GREY, fontSize: 15),
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: APP_GREEN,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSize chatAppBar(
    {@required double width,
    @required double v16,
    @required BuildContext context}) {
  return PreferredSize(
    preferredSize: Size(width, 56),
    child: Material(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(color: REAL_WHITE),
        padding: EdgeInsets.only(
            top: v16 * 2.25, left: v16 / 2, right: v16 / 2, bottom: v16 * 0.75),
        width: width,
        child: Theme(
          data: Theme.of(context).copyWith(primaryColor: APP_PRIMARY),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 24,
                    color: APP_GREY,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: v16 / 2),
                    child: Text(
                      "CHAT",
                      style: titleTextStyle.copyWith(
                          fontSize: 17, color: APP_GREY),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "Chat Support",
                  style: normalTextStyle.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
