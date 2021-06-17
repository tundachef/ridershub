import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ridershub/views/chats.dart';
import 'package:ridershub/views/history.dart';
import 'package:ridershub/views/orders.dart';
import 'package:ridershub/views/status.dart';

import 'colors.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index>
    with AutomaticKeepAliveClientMixin<Index> {
  PageController pageController;
  int pageIndex = 0;
  final indexKey = new GlobalKey<ScaffoldState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  onPageChanged(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double v16 = width / 20;
    super.build(context);
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: indexKey,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: REAL_WHITE,
            elevation: 4,
            showSelectedLabels: true,
            selectedItemColor: APP_PRIMARY,
            unselectedItemColor: APP_GREY.withAlpha(90),
            currentIndex: pageIndex,
            onTap: (index) {
              FocusScope.of(context).requestFocus(new FocusNode());

              pageController.jumpToPage(index);
            },
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              // BottomNavigationBarItem(
              //     icon: Icon(
              //       EvaIcons.activityOutline,
              //     ),
              //     label: "Status"),
              BottomNavigationBarItem(
                  icon:
                      Image.asset("assets/images/bottom_nav/status_empty.png"),
                  activeIcon: Image.asset(
                    "assets/images/bottom_nav/status_selected.png",
                  ),
                  label: "Status"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                      "assets/images/bottom_nav/deliveries_empty.png"),
                  activeIcon: Image.asset(
                    "assets/images/bottom_nav/deliveries_fill.png",
                  ),
                  label: "Orders"),

              BottomNavigationBarItem(
                  icon:
                      Image.asset("assets/images/bottom_nav/history_empty.png"),
                  activeIcon: Image.asset(
                    "assets/images/bottom_nav/history_fill.png",
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                  icon: Image.asset("assets/images/bottom_nav/chat.png"),
                  activeIcon: Image.asset(
                    "assets/images/bottom_nav/chat_selected.png",
                  ),
                  label: "Chat"),
            ],
          ),
          body: Container(
            width: width,
            height: height,
            child: PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                StatusPage(),
                OrdersPage(),
                HistoryPage(),
                ChatsPage(),
              ],
            ),
          ),
        ));
  }
}
