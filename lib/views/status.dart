import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lab3.dart';
import 'colors.dart';
import 'widgets/app_bars.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                  return MapPage();
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
                    Container(
                      // margin: EdgeInsets.only(left: v16),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: v16, vertical: v16 / 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: REAL_WHITE,
                            boxShadow: [LIGHT_BOXSHADOW]),
                        child: Text(
                          "You are scheduled to drive from 10:00 to 17:00",
                          maxLines: 3,
                          style: normalTextStyle.copyWith(color: APP_GREY),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: v16 * 3.5,
            //   left: v16,
            //   right: v16,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: v16, vertical: v16),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         color: REAL_WHITE,
            //         boxShadow: [LIGHT_BOXSHADOW]),
            //     child: Text(
            //       "Salalah St. Taymoor 956",
            //       overflow: TextOverflow.ellipsis,
            //       maxLines: 2,
            //       style: normalTextStyle.copyWith(color: APP_GREY),
            //     ),
            //   ),
            // ),
            // Positioned(
            //     bottom: v16 * 1,
            //     left: width / 2.8,
            //     child: InkWell(
            //       onTap: () => openAlertBox(width: width, v16: v16),
            //       child: Container(
            //         padding:
            //             EdgeInsets.symmetric(vertical: v16, horizontal: v16),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           boxShadow: [LIGHT_BOXSHADOW],
            //           color: APP_PRIMARY,
            //         ),
            //         child: Center(
            //             child: Text(
            //           "Ride Now",
            //           style: normalTextStyle.copyWith(color: REAL_WHITE),
            //         )),
            //       ),
            //     )),
            // Positioned(
            //     bottom: 0,
            //     child: Container(
            //       // height: 300,
            //       width: width,
            //       padding: EdgeInsets.only(left: v16, right: v16, top: v16),
            //       decoration: BoxDecoration(
            //           color: REAL_WHITE,
            //           borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(6),
            //               topRight: Radius.circular(6)),
            //           boxShadow: [
            //             BoxShadow(
            //                 color: REAL_BLACK.withOpacity(0.3),
            //                 offset: Offset(0, -2),
            //                 spreadRadius: 2,
            //                 blurRadius: 2)
            //           ]),
            //       child: Column(
            //         children: <Widget>[
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: <Widget>[
            //               Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Container(
            //                     child: Text(
            //                       "Snacks \'N\' More - Saada",
            //                       style: titleTextStyle,
            //                     ),
            //                   ),
            //                   Container(
            //                     child: Text(
            //                       "6 items",
            //                       style: normalTextStyle,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               CircularCountDownTimer(
            //                 duration: 60,
            //                 initialDuration: 0,
            //                 controller: CountDownController(),
            //                 width: 56,
            //                 height: 56,
            //                 ringColor: Colors.grey[300],
            //                 ringGradient: null,
            //                 fillColor: APP_PRIMARY,
            //                 fillGradient: null,
            //                 backgroundColor: Colors.transparent,
            //                 backgroundGradient: null,
            //                 strokeWidth: 4,
            //                 strokeCap: StrokeCap.square,
            //                 textStyle:
            //                     titleTextStyle.copyWith(color: APP_PRIMARY),
            //                 textFormat: CountdownTextFormat.SS,
            //                 isReverse: true,
            //                 isReverseAnimation: true,
            //                 isTimerTextShown: true,
            //                 autoStart: true,
            //                 onStart: () {
            //                   print('Countdown Started');
            //                 },
            //                 onComplete: () {
            //                   print('Countdown Ended');
            //                 },
            //               ),
            //             ],
            //           ),
            //           Container(
            //             padding:
            //                 EdgeInsets.only(top: v16 * 0.8, bottom: v16 * 0.6),
            //             child: Divider(
            //               color: DECENT_GREY_LIGHT,
            //               thickness: 1.5,
            //             ),
            //           ),
            //           Container(
            //             child: Column(
            //               children: <Widget>[
            //                 Container(
            //                   child: Text(
            //                     "14.5000 OMR",
            //                     style: titleTextStyle,
            //                   ),
            //                 ),
            //                 Container(
            //                   child: Text(
            //                     "Customer's payment",
            //                     style: normalTextStyle.copyWith(
            //                         color: APP_GREY, fontSize: 14),
            //                   ),
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.symmetric(
            //                       horizontal: v16, vertical: 8),
            //                   child: normalButton(
            //                       borderRadius: v16 * 1.5,
            //                       v16: v16,
            //                       bgColor: APP_PRIMARY,
            //                       title: "Accept"),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //     )),
             Positioned(
                bottom: 0,
                child: Container(
                  // height: 300,
                  width: width,
                  padding: EdgeInsets.only(left: v16, right: v16, top: v16),
                  decoration: BoxDecoration(
                      color: REAL_WHITE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6)),
                      boxShadow: [
                        BoxShadow(
                            color: REAL_BLACK.withOpacity(0.3),
                            offset: Offset(0, -2),
                            spreadRadius: 2,
                            blurRadius: 2)
                      ]),
                  child:)),
          ],
        ),
      ),
    );
  }

  openAlertBox({double width, double v16}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(v16 * 0.8))),
            contentPadding: EdgeInsets.only(top: v16),
            content: Container(
              width: width - (v16 * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Before You Begin",
                      textAlign: TextAlign.center,
                      style: normalTextStyle,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Make sure you're ready for your ride!",
                      textAlign: TextAlign.center,
                      style: normalTextStyle.copyWith(
                          fontSize: 15, color: APP_GREY),
                    ),
                  ),
                  dialogBullet("Charged phone with Data", v16: v16),
                  dialogBullet("Enough Fuel", v16: v16),
                  dialogBullet("Thermal Bag", v16: v16),
                  dialogBullet("Company T-Shirt", v16: v16),
                  // SizedBox(
                  //   height: 5.0,
                  // ),
                  // Divider(
                  //   color: Colors.grey,
                  //   height: 4.0,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: "Add Review",
                  //       border: InputBorder.none,
                  //     ),
                  //     maxLines: 8,
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 12),
                        padding: EdgeInsets.symmetric(
                            vertical: v16 / 2, horizontal: v16 * 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: APP_PRIMARY,
                        ),
                        child: Center(
                            child: Text(
                          "Start Riding",
                          style: normalTextStyle.copyWith(color: REAL_WHITE),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Container dialogBullet(String text, {@required double v16}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: DECENT_GREY, width: 1.5))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8, left: v16),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(color: DECENT_GREY, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Text(
            text,
            style: normalTextStyle.copyWith(color: APP_GREY, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
