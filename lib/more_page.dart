import 'package:flutter/material.dart';
import 'package:parallax/utils/more_list_class.dart';

import 'markdown_view.dart';

class MorePage extends StatefulWidget {
  final List<MoreList> entries = [
    new MoreList("Upcoming features", "upcoming_features", "assets/images/upcoming_features.png"),
    new MoreList("Release notes", "release_notes", "assets/images/release_notes.png"),
    new MoreList("How does it work?", "how_it_works", "assets/images/cpu.png"),
    new MoreList("About us", "about_us", "assets/images/about.png"),
    new MoreList("Privacy", "privacy", "assets/images/privacy.png"),
    new MoreList("Terms of Agreement", "terms_of_agreement", "assets/images/toa.png"),
    new MoreList("Code of Conduct", "code_of_conduct", "assets/images/coc.png"),
    new MoreList("Feedback", "feedback", "assets/images/feedback.png"),
    new MoreList("Report bug", "report_bug", "assets/images/bug.png"),
    
  ];
  MorePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MorePageState();
  }
}

class _MorePageState extends State<MorePage> {

  @override
  void initState() {
    super.initState();

  }
  void rowClicked(int i) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MarkdownView(view: this.widget.entries[i].getPath())),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "parallax",
          style: TextStyle(
            color: Color(0xffD8D8D8), 
            fontStyle: FontStyle.italic,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: this.widget.entries.length,
          itemBuilder: (BuildContext context, int i) {
            return Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: ListTile(
                onTap: () => rowClicked(i),
                contentPadding: EdgeInsets.only(left: 20),
                leading: Image.asset(this.widget.entries[i].getIcon(),
                  width: 24,
                ),
                title: Text(
                  this.widget.entries[i].getTitle(), 
                  style: TextStyle(
                    color: Color(0xffD8D8D8), 
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
    
  }
}