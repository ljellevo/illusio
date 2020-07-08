import 'package:flutter/material.dart';
import 'package:illusio/utils/cosmetic_helpers.dart';

class OverlayEffectSelector extends StatefulWidget {
  final PageController controller;
  final Function onPageChanged;
  final List<String> effects;
  final double currentPageValue;
  OverlayEffectSelector(
      {Key key,
      this.controller,
      this.onPageChanged,
      this.effects,
      this.currentPageValue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OverlayEffectSelectorState();
  }
}

class _OverlayEffectSelectorState extends State<OverlayEffectSelector> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: this.widget.controller,
        onPageChanged: this.widget.onPageChanged,
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.effects.length,
        itemBuilder: (context, i) {
          Widget constructLabel() {
            if (i == this.widget.currentPageValue.floor()) {
              // This label is leaving the view
              return Opacity(
                  opacity: 1.0,
                  child: Text(this.widget.effects[i],
                      style: TextStyle(
                        color: Color(0xffD8D8D8),
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center));
            } else if (i == this.widget.currentPageValue.floor() + 1) {
              // This label is comming to view
              return Opacity(
                  opacity: calculateOpacity(this.widget.currentPageValue),
                  child: Text(this.widget.effects[i],
                      style: TextStyle(
                        color: Color(0xffD8D8D8),
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center));
            } else {
              // This label is off screen
              return Text(this.widget.effects[i],
                  style: TextStyle(
                    color: Color(0xffD8D8D8),
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center);
            }
          }

          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: EdgeInsets.only(top: 55), child: constructLabel()),
          );
        });
  }
}
