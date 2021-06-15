import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ridershub/views/colors.dart';
import 'package:ridershub/views/index.dart';
import 'package:ridershub/views/status.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscure = true;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Location location = new Location();

  bool _serviceEnabled;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      backgroundColor: APP_PRIMARY,
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/images/login_bg.png",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: v16 * 2),
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Image.asset("assets/images/login_logo.png")),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: v16),
                      padding: EdgeInsets.symmetric(
                          horizontal: v16, vertical: v16 / 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(v16 * 1.6),
                        color: REAL_WHITE.withAlpha(95).withOpacity(0.38),
                      ),
                      child: TextField(
                          style: TextStyle(color: REAL_WHITE),
                          decoration: InputDecoration(
                              hintText: "RHID Number",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintStyle:
                                  normalTextStyle.copyWith(color: REAL_WHITE))),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: v16),
                      padding: EdgeInsets.symmetric(
                          horizontal: v16, vertical: v16 / 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(v16 * 1.6),
                        color: REAL_WHITE.withAlpha(95).withOpacity(0.38),
                      ),
                      child: TextField(
                          style: TextStyle(color: REAL_WHITE),
                          decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscure = !_obscure;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 8),
                                  child: _obscure
                                      ? Icon(
                                          Icons.visibility,
                                          // size: 22,
                                          color: REAL_WHITE,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                          // size: 22,
                                          color: REAL_WHITE,
                                        ),
                                ),
                              ),
                              hintStyle:
                                  normalTextStyle.copyWith(color: REAL_WHITE))),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: v16),
                      padding: EdgeInsets.symmetric(
                          horizontal: v16, vertical: v16 / 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(v16 * 1.6),
                        color: REAL_WHITE.withAlpha(95).withOpacity(0.38),
                      ),
                      child: TextField(
                          style: TextStyle(color: REAL_WHITE),
                          decoration: InputDecoration(
                              hintText: "Select Delivery Region",
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    // size: 22,
                                    color: REAL_WHITE,
                                  ),
                                ),
                              ),
                              hintStyle:
                                  normalTextStyle.copyWith(color: REAL_WHITE))),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => Index())),
                      child: normalButtonWithBorder(
                          v16: v16,
                          borderColor: REAL_WHITE,
                          bgColor: APP_PRIMARY,
                          borderRadius: v16 * 2,
                          title: "Login"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
