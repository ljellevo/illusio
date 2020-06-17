import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parallax/utils/DrawCircle.dart';
import 'package:parallax/utils/Enums.dart';




class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _effects = ["mura masa", "ken burns", "sicko mode"];
  String _currentEffect = "";
  double _scale;
  File _image;
  HomeViewState _homeViewState;
  final picker = ImagePicker();
  PageController controller = PageController();
  var currentPageValue = 0.0;

 @override
  void initState() {
    super.initState();
    _homeViewState = HomeViewState.camera;
    _scale = 1.0;
    _currentEffect = _effects[0];
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }

  

  Widget topBar() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      height: 86,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(top:40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container()
            ),
            Expanded(
              child: Text(
                "", 
                style: TextStyle(
                  color: Color(0xffD8D8D8), 
                  fontStyle: FontStyle.italic,
                  fontSize: 14
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                    GestureDetector(
                      child: Image.asset(
                        "assets/images/share.png",
                        width: 20,
                        height: 20,
                        ),
                      onTap: () => {
                        print("share")
                      },
                    ),
                    
                      GestureDetector(
                      child: Image.asset(
                        "assets/images/more.png",
                        width: 20,
                        height: 20,
                        ),
                      onTap: () => {
                        print("more")
                      },
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      )
    );
  }

  Widget cameraButton() {

    return Transform.scale(
      scale: _scale,
      child: GestureDetector(
        //onDoubleTap: () {showHangoutPanel();},
        onTap: () {
          print("camera");
          setState(() {
            _homeViewState = HomeViewState.camera;
          });
        },
        child: Container(
          height: 70,
          width: 70,

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.all(
              const Radius.circular(50)
            )
          ),
          child: CustomPaint(
            foregroundPainter: DrawCircle(
                lineColor: Colors.amber,
                completeColor: Colors.white.withOpacity(0.9),
                completePercent: 100,
                width: 2.0
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Transform.translate(
        offset: Offset(0.0, 0.7),
        child: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  "assets/images/gallery.png",
                  width: 27,
                  height: 27,
                  ),
                onTap: () => {
                  getImage()
                },
              ),
              cameraButton(),
              GestureDetector(
                child: Image.asset(
                  "assets/images/focus.png",
                  width: 27,
                  height: 27,
                  ),
                onTap: () => {
                  print("focus")
                },
              ),
            ],
          ),
        )
      )
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if(pickedFile == null) {
        _homeViewState = HomeViewState.camera;
      } else {
        _image = File(pickedFile.path);
        _homeViewState = HomeViewState.gallery;
         
      }
    });
  }

  Widget imageViewer() {
    if (_homeViewState == HomeViewState.camera) {
      return Center(
        child: Text(
          "Camera is active",
          style: TextStyle(
            color: Color(0xffD8D8D8), 
            fontStyle: FontStyle.italic,
            fontSize: 14
          ),
        ),
      );
    } else {
      return Image.file(
        _image, 
        fit: BoxFit.fitWidth, 
        width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height,
      );
    }
  }

  double calculateOpacity(double currentPageValue){
    double safeValue = currentPageValue % 1;
    var x = safeValue.abs() * -1;
    var opacity = x < 0.9 ? (1 * x * x * x * x) : 1 - pow(-2 * x + 2, 4) / 2;
    
    if (opacity <= 0.0) {
      return 0.1;
    } else if (opacity >= 1.0) {
      return 1.0;
    } else {
      return opacity;
    }   
  }

  Widget overlay(context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: (i) => {_currentEffect = _effects[i]},
      scrollDirection: Axis.horizontal,
      itemCount: _effects.length,
      itemBuilder: (context, i) {
        Widget constructLabel() {
          if (i == currentPageValue.floor()) {
            // This label is leaving the view
            return Opacity(
              opacity: 1.0,
              child: Text(
                _effects[i], 
                style: TextStyle(
                  color: Color(0xffD8D8D8), 
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center
              )
            );
          } else if (i == currentPageValue.floor() + 1){
            // This label is comming to view
            return Opacity(
              opacity: calculateOpacity(currentPageValue),
              child: Text(
                _effects[i], 
                style: TextStyle(
                  color: Color(0xffD8D8D8), 
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center
              )
            );
          } else {
            // This label is off screen
            return Text(_effects[i], style: TextStyle(
                color: Color(0xffD8D8D8), 
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
              textAlign: TextAlign.center
            );
          }
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 55),
            child: constructLabel()
          ),
        );
      }
    );
  }
  
  Widget gradientBackgound() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          height: 86,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black,
                  Colors.black54,
                  Colors.transparent
                ],
                stops: [
                  0.4,
                  0.8,
                  1.0
                ]
              )          
            ),
          )
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Transform.translate(
            offset: Offset(0.0, 0.7),
            child: Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.transparent,
                      Colors.black87,
                      Colors.black,
                    ],
                    stops: [
                      0.0,
                      0.9,
                      1.0
                    ]
                  )          
                ),
              )
            )
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            imageViewer(),
            gradientBackgound(),
            overlay(context),
            topBar(),
            bottomBar(),
          ],
        ),
      )
    );
  }
}
