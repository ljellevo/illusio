import 'package:flutter/material.dart';

import 'DrawCircle.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
double _scale;

 @override
  void initState() {
    super.initState();
    _scale = 1.0;
  }

  Widget topBar() {
    return Positioned(
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
                  "mura masa", 
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
                        onTap: () => {},
                      ),
                      
                       GestureDetector(
                        child: Image.asset(
                          "assets/images/more.png",
                          width: 20,
                          height: 20,
                          ),
                        onTap: () => {},
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        )
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
            child: Row(
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
                    print("gallery")
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
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/woman.png'),
          topBar(),
          bottomBar(),
        ],
      )
    );
  }
}
