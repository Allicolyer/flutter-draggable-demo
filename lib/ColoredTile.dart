import 'package:flutter/material.dart';

class ColoredTile extends StatelessWidget {
  final String type;
  final String value;

  // value is optional
  ColoredTile(this.type, [this.value]);

  Color getBoxColor(type) {
    if (type == "unit") {
      return Colors.blue;
    } else if (type == "number") {
      return Colors.red;
    } else
      return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: value != null ? Center(child: Text(value)) : null,
        width: 60.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: getBoxColor(type), spreadRadius: 3),
          ],
        ));
  }
}
