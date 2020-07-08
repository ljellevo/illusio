import 'package:flutter/material.dart';

class TopButtonBar extends StatefulWidget {
  final Function shareOnClick;
  final Function moreOnClick;
  TopButtonBar({Key key, this.shareOnClick, this.moreOnClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TopButtonBarState();
  }
}

class _TopButtonBarState extends State<TopButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0.0,
        left: 0.0,
        height: 86,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(child: Container()),
              Expanded(
                child: Text(
                  "",
                  style: TextStyle(
                      color: Color(0xffD8D8D8),
                      fontStyle: FontStyle.italic,
                      fontSize: 14),
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
                        "assets/icons/share.png",
                        width: 20,
                        height: 20,
                      ),
                      onTap: this.widget.shareOnClick,
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/icons/more.png",
                        width: 20,
                        height: 20,
                      ),
                      onTap: this.widget.moreOnClick,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
