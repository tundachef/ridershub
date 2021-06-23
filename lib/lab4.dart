import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'dart:math';

void main() {
  runApp(SnappingSheetExampleApp());
}

class SimpleSnappingSheet extends StatelessWidget {
  final ScrollController listViewController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      child: Background(),
      lockOverflowDrag: true,
      snappingPositions: [
        SnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
          positionFactor: 0.5,
        ),
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.bottom,
          snappingCurve: Curves.easeInExpo,
          snappingDuration: Duration(seconds: 1),
          positionFactor: 0.9,
        ),
      ],
      grabbing: GrabbingWidget(),
      grabbingHeight: 75,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: listViewController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: listViewController,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                color: Colors.green[200],
                height: 100,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Widgets below are just helper widgets for this example
class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Placeholder(
        color: Colors.green[200],
      ),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 2,
            margin: EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
          )
        ],
      ),
    );
  }
}

class SnappingSheetExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snapping Sheet Examples',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[700],
          elevation: 0,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        primarySwatch: Colors.grey,
      ),
      home: PageWrapper(),
    );
  }
}

class PageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Example",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Menu();
                }),
              ),
            },
          )
        ],
      ),
      body: SimpleSnappingSheet(),
    );
  }
}

// import 'package:example/pages/horizontal_example.dart';
// import 'package:example/pages/placeholder_example.dart';
// import 'package:example/pages/preview_page.dart';
// import 'package:example/pages/preview_reverse_page.dart';
// import 'package:example/shared/appbar.dart';
// import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Other Examples").build(context),
      body: Container(
        child: LayoutBuilder(builder: (context, boxConstraints) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: boxConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    MenuButton(
                      page: PreviewPage(),
                      text: "Preview Example",
                      color: Colors.grey[300],
                    ),
                    MenuButton(
                      page: PlaceholderExample(),
                      text: "Placeholder Example",
                      color: Colors.green[300],
                    ),
                    MenuButton(
                      page: PreviewReversePage(),
                      text: "Preview Reverse Example",
                      color: Colors.grey[300],
                    ),
                    MenuButton(
                      page: HorizontalExample(),
                      text: "Horizontal Example",
                      color: Colors.green[300],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final Color color;
  final Widget page;

  const MenuButton(
      {Key key, this.color, @required this.text, @required this.page})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: color,
        constraints: BoxConstraints(minHeight: 200.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return page;
            }));
          },
          child: Center(
            child: Text(
              this.text,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// PAGES

class PreviewPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet").build(context),
      body: SnappingSheet(
        lockOverflowDrag: true,
        snappingPositions: [
          SnappingPosition.factor(
            positionFactor: 0.0,
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
          SnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          SnappingPosition.factor(positionFactor: 0.9),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 75,
        grabbing: DefaultGrabbing(),
        sheetBelow: SnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}

// import 'package:example/shared/appbar.dart';
// import 'package:example/shared/dummy_background.dart';
// import 'package:flutter/material.dart';
// import 'package:snapping_sheet/snapping_sheet.dart';

class HorizontalExample extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet").build(context),
      body: Stack(
        children: [
          DummyBackgroundContent(),
          Positioned(
            right: 0,
            left: 0,
            top: 200,
            height: 100,
            child: SnappingSheet.horizontal(
              lockOverflowDrag: true,
              snappingPositions: [
                SnappingPosition.factor(
                  positionFactor: 1.0,
                  grabbingContentOffset: GrabbingContentOffset.bottom,
                ),
                SnappingPosition.factor(
                  positionFactor: 0.5,
                ),
                SnappingPosition.factor(
                  positionFactor: 0.2,
                ),
              ],
              grabbingWidth: 50,
              grabbing: _GrabbingWidget(),
              sheetRight: SnappingSheetContent(
                draggable: true,
                childScrollController: _scrollController,
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    controller: _scrollController,
                    padding: EdgeInsets.all(15),
                    scrollDirection: Axis.horizontal,
                    children: [
                      NumberBox(number: "1"),
                      NumberBox(number: "2"),
                      NumberBox(number: "3"),
                      NumberBox(number: "4"),
                      NumberBox(number: "5"),
                      NumberBox(number: "6"),
                      NumberBox(number: "7"),
                      NumberBox(number: "8"),
                      NumberBox(number: "9"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 7,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          Container(
            width: 2,
            color: Colors.grey[300],
            margin: EdgeInsets.only(top: 15, bottom: 15),
          )
        ],
      ),
    );
  }
}

class NumberBox extends StatelessWidget {
  final String number;

  const NumberBox({Key key, @required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Center(child: Text(number)),
      width: 75,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.lightGreen[300],
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:snapping_sheet/snapping_sheet.dart';

class GettingStartedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SnappingSheet(
        child: MyOwnPageContent(), // TODO: Add your content here
        grabbingHeight: 75,
        grabbing: MyOwnGrabbingWidget(), // TODO: Add your grabbing widget here,
        sheetAbove: SnappingSheetContent(
          draggable: true,
          child: MyOwnSheetContent(), // TODO: Add your sheet content here
        ),
      ),
    );
  }
}

class MyOwnPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class MyOwnGrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class MyOwnSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// import 'package:example/shared/appbar.dart';
// import 'package:example/shared/dummy_background.dart';
// import 'package:flutter/material.dart';
// import 'package:snapping_sheet/snapping_sheet.dart';

class PlaceholderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Placeholder Example").build(context),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SnappingSheet(
          snappingPositions: [
            SnappingPosition.factor(
              positionFactor: 0.0,
              snappingCurve: Curves.easeOutExpo,
              snappingDuration: Duration(seconds: 1),
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.factor(
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1750),
              positionFactor: 0.5,
            ),
            SnappingPosition.factor(
              grabbingContentOffset: GrabbingContentOffset.bottom,
              snappingCurve: Curves.bounceOut,
              snappingDuration: Duration(seconds: 1),
              positionFactor: 1.0,
            ),
          ],
          child: DummyBackgroundContent(),
          grabbingHeight: 100,
          grabbing: Container(
            color: Colors.white.withOpacity(0.75),
            child: Placeholder(color: Colors.black),
          ),
          sheetAbove: SnappingSheetContent(
            draggable: true,
            child: Container(
                color: Colors.white.withOpacity(0.75),
                child: Placeholder(color: Colors.green)),
          ),
          sheetBelow: SnappingSheetContent(
            draggable: true,
            child: Container(
              color: Colors.white.withOpacity(0.75),
              child: Placeholder(color: Colors.green[800] ?? Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:example/shared/appbar.dart';
// import 'package:example/shared/default_grabbing.dart';
// import 'package:example/shared/dummy_background.dart';
// import 'package:example/shared/dummy_content.dart';
// import 'package:flutter/material.dart';
// import 'package:snapping_sheet/snapping_sheet.dart';

class PreviewReversePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet - Reverse").build(context),
      body: SnappingSheet(
        lockOverflowDrag: true,
        snappingPositions: [
          SnappingPosition.factor(
            grabbingContentOffset: GrabbingContentOffset.bottom,
            positionFactor: 1.0,
          ),
          SnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          SnappingPosition.factor(
            positionFactor: 0.1,
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 75,
        grabbing: DefaultGrabbing(
          reverse: true,
        ),
        sheetAbove: SnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            reverse: true,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}

// SHARED
// import 'package:flutter/material.dart';
// import 'dummy_material.dart';

class DummyBackgroundContent extends StatelessWidget {
  final accent = Color(0xff8ba38d);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: IntrinsicHeight(
                        child: SquareMaterial(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextMaterial(width: 54),
                          SquareMaterial(
                            color: accent,
                          ),
                          TextMaterial(width: 104),
                          SquareMaterial(),
                          TextMaterial(width: 64),
                          SquareMaterial(
                            color: accent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SquareMaterial(height: 200),
              TextMaterial(width: double.infinity),
              TextMaterial(width: 140.0),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(flex: 1, child: SquareMaterial(height: 200)),
                  Expanded(
                      flex: 1,
                      child: SquareMaterial(
                        height: 200,
                        color: accent,
                      )),
                  Expanded(flex: 1, child: SquareMaterial(height: 200)),
                  Expanded(flex: 3, child: SquareMaterial(height: 200)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:math';

// import 'package:flutter/material.dart';

class DefaultGrabbing extends StatelessWidget {
  final Color color;
  final bool reverse;

  const DefaultGrabbing(
      {Key key, this.color = Colors.white, this.reverse = false})
      : super(key: key);

  BorderRadius _getBorderRadius() {
    var radius = Radius.circular(25.0);
    return BorderRadius.only(
      topLeft: reverse ? Radius.zero : radius,
      topRight: reverse ? Radius.zero : radius,
      bottomLeft: reverse ? radius : Radius.zero,
      bottomRight: reverse ? radius : Radius.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 10,
            color: Colors.black.withOpacity(0.15),
          )
        ],
        borderRadius: _getBorderRadius(),
        color: this.color,
      ),
      child: Transform.rotate(
        angle: reverse ? pi : 0,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.5),
              child: _GrabbingIndicator(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 2.0,
                  color: Colors.grey[300],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _GrabbingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.grey[400],
      ),
      height: 5,
      width: 75,
    );
  }
}

// import 'package:flutter/material.dart';

class DarkAppBar {
  final String title;

  const DarkAppBar({@required this.title});

  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[700],
      elevation: 0,
      title: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// import 'package:example/shared/dummy_material.dart';
// import 'package:flutter/material.dart';

class DummyContent extends StatelessWidget {
  final bool reverse;
  final ScrollController controller;

  const DummyContent({Key key, this.controller, this.reverse = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        reverse: this.reverse,
        padding: EdgeInsets.all(20).copyWith(top: 30),
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextMaterial(width: 150, alignment: Alignment.center),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareMaterial(
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 15),
                SquareMaterial(
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 15),
                SquareMaterial(
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            SizedBox(height: 25),
            TextMaterial(width: double.infinity),
            TextMaterial(width: 160),
            Row(
              children: [
                Expanded(child: SquareMaterial(height: 200)),
                Expanded(child: SquareMaterial(height: 200)),
              ],
            ),
            Row(
              children: [
                Expanded(child: SquareMaterial(height: 200)),
                Expanded(child: SquareMaterial(height: 200)),
                Expanded(child: SquareMaterial(height: 200)),
              ],
            ),
            SizedBox(height: 25),
            TextMaterial(width: double.infinity),
            TextMaterial(width: double.infinity),
            TextMaterial(width: 230),
            SquareMaterial(height: 300),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(child: SquareMaterial(height: 100)),
                Expanded(child: SquareMaterial(height: 100)),
                Expanded(child: SquareMaterial(height: 100)),
                Expanded(child: SquareMaterial(height: 100)),
                Expanded(child: SquareMaterial(height: 100)),
              ],
            ),
            TextMaterial(width: double.infinity),
            TextMaterial(width: 230),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class SquareMaterial extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const SquareMaterial({
    Key key,
    this.height = 100.0,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 0,
        color: this.color ?? Colors.grey[300],
        child: SizedBox(
          width: this.width,
          height: this.height,
        ),
      ),
    );
  }
}

class TextMaterial extends StatelessWidget {
  final double width;
  final Alignment alignment;

  const TextMaterial(
      {Key key, @required this.width, this.alignment = Alignment.topLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(5),
          ),
          height: 13.0,
          width: width,
        ),
      ),
    );
  }
}
