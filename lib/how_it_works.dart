import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*
class HowItWorks extends StatelessWidget {
  String _markdownSource;
  Future<http.Response> fetchAlbum() {
    return http.get('https://jsonplaceholder.typicode.com/albums/1');
  }

  @override
  void initState() {
    super.initState();
    _markdownSource = fetchAlbum();
  }

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
            child: 
            /*
            Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/icon.png",
                  width: 150,
                ),
                Text(
                  "Dette er mye tekst for å sjekke hvordan det blir håndtert i flutter når vi har nested en container med en gitt width",
                  style: TextStyle(color: Color(0xffD8D8D8), fontStyle: FontStyle.italic,fontSize: 14),
                )
              ],
            )
            */
            Markdown(data: markdownSource);
          ),
        )
      ),
    );
  }
}

*/

class HowItWorks extends StatefulWidget {
  HowItWorks({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HowItWorksState();
  }
}

class _HowItWorksState extends State<HowItWorks> {
  String _markdownSource;
  Future<http.Response> fetchAlbum() {
    print("called");
    return http.get('https://parallax-server.herokuapp.com/api/how_it_works');
  }

  @override
  void initState() {
    super.initState();
    getMarkdown();
  }

   void getMarkdown() async {
    http.Response temp = await fetchAlbum();
    Map<String, dynamic> res = json.decode(temp.body);
    String markdown = res["data"];
    print("res:" + markdown);
    setState(() {
      _markdownSource = markdown;
    });
  }

  TextStyle baseTextStyle(double fontSize) {
    return TextStyle(
      color: Color(0xffD8D8D8), 
      fontStyle: FontStyle.italic,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: 
        Markdown(
          data: _markdownSource != null ? _markdownSource : "",
          styleSheet: MarkdownStyleSheet(
            p: baseTextStyle(14),
            h1: baseTextStyle(20),
            h2: baseTextStyle(20),
            h3: baseTextStyle(16)
          ),
        )
      ),
    );
  }
}