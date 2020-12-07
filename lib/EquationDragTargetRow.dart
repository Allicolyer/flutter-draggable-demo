import 'package:flutter/material.dart';
import 'package:draggable_demo/ColoredTile.dart';

class EquationDragTargetRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: [EquationDragTarget("number"), EquationDragTarget("unit")]);
  }
}

// ignore: must_be_immutable
class EquationDragTarget extends StatelessWidget {
  final String typeAccepted;
  EquationDragTarget(this.typeAccepted);

  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return DragTarget<Map<String, String>>(builder: (
      context,
      candidateData,
      rejectedData,
    ) {
      return accepted
          ? ColoredTile(typeAccepted, "accepted")
          : ColoredTile(typeAccepted);
    }, onWillAccept: (Map<String, String> data) {
      if (data["type"] == typeAccepted) {
        return true;
      } else {
        return false;
      }
    }, onAccept: (data) {
      accepted = true;
    });
  }
}
