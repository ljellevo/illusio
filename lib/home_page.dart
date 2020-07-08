import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:illusio/classes/image_payload.dart';
import 'package:illusio/utils/network.dart';
import 'package:image_picker/image_picker.dart';
import 'package:illusio/components/image_viewer.dart';
import 'package:illusio/components/top_button_bar.dart';
import 'package:illusio/more_page.dart';
import 'components/bottom_button_bar.dart';
import 'components/gradient_backgound.dart';
import 'components/overlay_effect_selector.dart';
import 'utils/enums.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _effects = ["mura masa", "ken burns", "sicko mode"];
  String _currentEffect = "";
  File _image;
  HomeViewState _homeViewState;
  PageController controller = PageController();
  var currentPageValue = 0.0;

 @override
  void initState() {
    super.initState();
    _homeViewState = HomeViewState.init;
    _currentEffect = _effects[0];
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });
  }

  void onPageChanged(i) {
    _currentEffect = _effects[i];
    print(_currentEffect);
  }

  void shareOnClick() {
    print("share root");
  }

  void moreOnClick() {
    print("more root");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MorePage()),
    );
  }



  void galleryButtonOnClick(PickedFile pickedFile) {
    setState(() {
      if(pickedFile == null && _image == null) {
        _homeViewState = HomeViewState.init;
      } else if(pickedFile == null && _image != null) {
        _homeViewState = HomeViewState.gallery;
      } else {
        _image = File(pickedFile.path);
        _homeViewState = HomeViewState.gallery;
      }
    });
  }

  void focusButtonOnClick() {
    print("focus root");
    setState(() {
      _homeViewState = HomeViewState.focus;
    });
  }

  void cameraButtonOnClick() async {
    ImagePlayload imagePlayload = new ImagePlayload(_currentEffect, _image);
    Network network = new Network();
    network.uploadImage(json.encode(imagePlayload));
    /*
    setState(() {
      _homeViewState = HomeViewState.init;
      _image = null;
    });
    */
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            ImageViewer(homeViewState: _homeViewState, image: _image,),
            GradientBackgound(),
            OverlayEffectSelector(controller: controller, onPageChanged: onPageChanged, effects: _effects, currentPageValue: currentPageValue,),
            TopButtonBar(shareOnClick: shareOnClick, moreOnClick: moreOnClick),
            BottomButtonBar(cameraButtonOnClick: cameraButtonOnClick, galleryButtonOnClick: galleryButtonOnClick, focusButtonOnClick: focusButtonOnClick, homeViewState: _homeViewState,)
          ],
        ),
      )
    );
  }
}
