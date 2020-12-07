import 'package:flutter/material.dart';
import 'package:draggable_demo/ColoredTile.dart';

class DraggableEquationTileRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      DraggableEquationTile("moles", "unit"),
      DraggableEquationTile("0.1", "number"),
      DraggableEquationTile("1.0", "number"),
      DraggableEquationTile("10.0", "number"),
      DraggableEquationTile("kg", "unit"),
    ]);
  }
}

class DraggableEquationTile extends StatelessWidget {
  final String value;
  final String type;
  DraggableEquationTile(this.value, this.type);

  @override
  Widget build(BuildContext context) {
    return Draggable<Map<String, String>>(
        data: {'type': type, "value": value},
        feedback: Material(child: ColoredTile(type, value)),
        child: ColoredTile(type, value),
        childWhenDragging:
            Opacity(opacity: 0.7, child: ColoredTile(type, value)));
  }
}
