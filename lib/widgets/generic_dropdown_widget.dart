import 'package:flutter/material.dart';
import '../settings/data.dart';
import '../models/entity.dart';

class GenericDropdownWidget extends StatelessWidget {
  final List<Entity> list;
  final Entity selected;
  final callBack;
  final bool isExpanded;

  const GenericDropdownWidget({
    @required this.list,
    @required this.selected,
    @required this.callBack,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: isExpanded,
        underline: SizedBox(),
        hint: Text(SAMPLE_HINT),
        value: selected,
        items: list.map((Entity entity) {
          return DropdownMenuItem<Entity>(
            value: entity,
            child: FittedBox(fit: BoxFit.contain, child: Text(entity.name)),
          );
        }).toList(),
        onChanged: callBack);
  }
}
