import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarkdownView extends StatefulWidget {
  final String view;
  MarkdownView({Key key, this.view}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MarkdownViewState();
  }
}

class _MarkdownViewState extends State<MarkdownView> {
  String _markdownSource;
  Future<http.Response> fetchAlbum() {
    return http.get('https://parallax-server.herokuapp.com/api/' + this.widget.view);
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