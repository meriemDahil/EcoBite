import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final Icon suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const SearchWidget({
    Key? key,
    this.hintText = 'Search',
    this.fillColor = const Color.fromARGB(214, 248, 248, 240), 
    this.suffixIcon = const Icon(Icons.search, color: Colors.black), 
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
