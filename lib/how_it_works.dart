import 'package:flutter/material.dart';

class HowItWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Dette er mye tekst for å sjekke hvordan det blir håndtert i flutter når vi har nested en container med en gitt width",
                  style: TextStyle(color: Color(0xffD8D8D8), fontStyle: FontStyle.italic,fontSize: 14),
                )
              ],
            )
          ),
        )
      ),
    );
  }
}