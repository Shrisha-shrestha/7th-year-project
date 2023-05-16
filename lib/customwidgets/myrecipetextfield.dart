import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  const CustomField(
      {super.key,
      required this.val,
      required this.Name,
      required this.controller});
  final AutovalidateMode val;
  final String Name;
  final TextEditingController controller;
  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextFormField(
        maxLines: widget.Name == 'Description' || widget.Name == 'Instructions'
            ? 6
            : 1,
        autovalidateMode: widget.val,
        controller: widget.controller,
        validator: (val) => val!.isEmpty ? 'PLease fill this field' : null,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: widget.Name,
          labelStyle: TextStyle(color: Colors.black),
        ),
        onSaved: (input) {},
        onChanged: (val) {},
      ),
    );
  }
}
