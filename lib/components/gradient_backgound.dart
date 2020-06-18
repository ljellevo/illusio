import 'package:flutter/material.dart';

class GradientBackgound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}