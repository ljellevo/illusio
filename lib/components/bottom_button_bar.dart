import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:illusio/utils/enums.dart';
import '../utils/draw_circle.dart';

class BottomButtonBar extends StatefulWidget {
  final Function cameraButtonOnClick;
  final Function galleryButtonOnClick;
  final Function focusButtonOnClick;
  final HomeViewState homeViewState;
  final picker = ImagePicker();
  BottomButtonBar(
      {Key key,
      this.cameraButtonOnClick,
      this.galleryButtonOnClick,
      this.focusButtonOnClick,
      this.homeViewState})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomButtonBarState();
  }
}

class _BottomButtonBarState extends State<BottomButtonBar> {
  Future getImage() async {
    final pickedFile =
        await this.widget.picker.getImage(source: ImageSource.gallery);
    this.widget.galleryButtonOnClick(pickedFile);
  }

  Widget cameraButton() {
    return Transform.scale(
      scale: 1.0,
      child: GestureDetector(
        onTap: this.widget.cameraButtonOnClick,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.all(const Radius.circular(50))),
          child: CustomPaint(
            foregroundPainter: DrawCircle(
                lineColor: Colors.amber,
                completeColor: Colors.white.withOpacity(0.9),
                completePercent: 100,
                width: 2.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        left: 0.0,
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Transform.translate(
            offset: Offset(0.0, 0.7),
            child: Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      "assets/icons/gallery.png",
                      width: 27,
                      height: 27,
                    ),
                    onTap: () => {getImage()},
                  ),
                  Image.asset(
                    "assets/icons/arrow-right.png",
                    width: 15,
                    height: 15,
                    color: this.widget.homeViewState == HomeViewState.init
                        ? Colors.white38
                        : null,
                  ),
                  /*
              GestureDetector(
                child: Image.asset(
                  "assets/images/generate-button.png",
                  width: 70,
                  height: 70,
                  ),
                onTap: () => {
                  this.widget.cameraButtonOnClick
                },
              ),
              */
                  GestureDetector(
                    child: Image.asset(
                      "assets/icons/focus.png",
                      width: 27,
                      height: 27,
                      color: this.widget.homeViewState == HomeViewState.init
                          ? Colors.white38
                          : null,
                    ),
                    onTap: this.widget.focusButtonOnClick,
                  ),
                  Image.asset(
                    "assets/icons/arrow-right.png",
                    width: 15,
                    height: 15,
                    color: this.widget.homeViewState == HomeViewState.init ||
                            this.widget.homeViewState == HomeViewState.gallery
                        ? Colors.white38
                        : null,
                  ),
                  cameraButton(),
                ],
              ),
            )));
  }
}
