import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parallax/utils/enums.dart';

class ImageViewer extends StatefulWidget {
  final HomeViewState homeViewState;
  final File image;
  ImageViewer({Key key, this.homeViewState, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageViewerState();
  }
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    if (this.widget.homeViewState == HomeViewState.camera) {
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
        this.widget.image, 
        fit: BoxFit.fitWidth, 
        width: MediaQuery.of(context).size.width, 
        height: MediaQuery.of(context).size.height,
      );
    }
  }
}