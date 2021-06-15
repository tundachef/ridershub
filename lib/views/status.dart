import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ridershub/views/widgets/statusMap.dart';

import 'colors.dart';
import 'widgets/app_bars.dart';

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
        child: Stack(
          children: <Widget>[
            Positioned.fill(
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
            Positioned(
              top: v16,
              left: v16,
              right: v16,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: v16 / 2),
                      child: Row(
                        children: <Widget>[
                          Material(
                            elevation: 2.8,
                            borderRadius: BorderRadius.circular(v16 * 0.9),
                            child: Container(
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
                          ),
                          Container(
                            margin: EdgeInsets.only(left: v16 / 2),
                            child: Material(
                              elevation: 2.8,
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: v16, vertical: v16 / 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "New Salalah Zone",
                                  style: normalTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: v16),
                      child: Material(
                        elevation: 2.8,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: v16, vertical: v16 / 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "You are scheduled to drive from 10:00 to 17:00",
                            maxLines: 3,
                            style: normalTextStyle.copyWith(color: APP_GREY),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: v16 * 3,
              left: v16,
              right: v16,
              child: Material(
                elevation: 2.8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: v16, vertical: v16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Salalah St. Taymoor 956 ascsdf sdsdvdfdfk sfj sdjj ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: normalTextStyle.copyWith(color: APP_GREY),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: v16 * 1.5,
                left: width / 3,
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: v16 / 2, horizontal: v16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: APP_PRIMARY,
                    ),
                    child: Center(
                        child: Text(
                      "Ride Now",
                      style: normalTextStyle.copyWith(color: REAL_WHITE),
                    )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
