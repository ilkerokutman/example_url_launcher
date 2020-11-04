import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericInputBoxWidget extends StatelessWidget {
  final controller;
  final String value;
  final String hint;
  final onSaved;
  final validator;
  const GenericInputBoxWidget({
    @required this.controller,
    @required this.value,
    this.hint = "",
    @required this.onSaved,
    @required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Theme.of(context).primaryColorDark, width: 1),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Theme.of(context).primaryColorDark, width: 1),
          // ),
          hintText: hint,
        ),
        maxLines: 1,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        validator: validator,
        onSaved: onSaved);
  }
}
