import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget customTextField({String? labeltext, Function(String)? onChanged}) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'value can\'t be empty ';
      } else {
        return null;
      }
    },
    onChanged: onChanged,
    // keyboardType: TextInputType.text,

    decoration: InputDecoration(
      labelText: labeltext,
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  );
}
