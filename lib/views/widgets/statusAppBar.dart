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
