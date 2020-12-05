import 'package:flutter/material.dart';
import 'package:draggable_demo/ColoredTile.dart';

class EquationDragTargetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: [EquationDragTarget("number"), EquationDragTarget("unit")]);
  }
}

class EquationDragTarget extends StatefulWidget {
  final String typeAccepted;
  EquationDragTarget(this.typeAccepted);

  @override
  _EquationDragTargetState createState() => _EquationDragTargetState();
}

class _EquationDragTargetState extends State<EquationDragTarget> {
  String value = "";
  
  @override
  Widget build(BuildContext context) {
    return DragTarget(builder: (
      context,
      List<String> candidateData,
      rejectedData,
    ) {
      return ColoredTile(widget.typeAccepted, value);
    }, onWillAccept: (Map<String, String> data) {
      if (data["type"] == widget.typeAccepted) {
        return true;
      } else {
        return false;
      }
    }, onAccept: (data) {
      setState(() {
        value = data["value"];
      });
      return true;
    });
  }
}
