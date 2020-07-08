import 'dart:io';

import 'package:flutter/material.dart';
import 'package:illusio/home_page.dart';


class ImageViewer extends StatefulWidget {
  final HomeViewState homeViewState;
  final File image;
  ImageViewer({Key key, this.homeViewState, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageViewerState();
  }
}

class _ImageViewerState extends State<ImageViewer>
    with TickerProviderStateMixin {
  bool bottom = true;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.homeViewState == HomeViewState.init) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Center(
              child: Text(
                "please import an image",
                style: TextStyle(
                    color: Color(0xffD8D8D8),
                    fontStyle: FontStyle.italic,
                    fontSize: 14),
              ),
            ),
            AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                final pos = 120 + (animationController.value * 7);
                return Positioned(
                    bottom: pos,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Image.asset(
                            "assets/icons/arrow-down.png",
                            width: 24,
                            height: 24,
                          ),
                          Container(width: 15),
                          Container(width: 24),
                          Container(width: 15),
                          Container(width: 70),
                        ],
                      ),
                    ));
              },
            ),
          ],
        ),
      );
    } else {
      return Image.file(
        this.widget.image,
        fit: BoxFit.fitWidth,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      );
    }
  }
}
