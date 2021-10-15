import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  const Searchbar({Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //width: 400,
      height: 50,
      child: TextField(
        cursorColor: Colors.blue,
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
          labelText: 'Subway Search',
          hintText: '지하철 검색',
          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 4, color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(width: 2, color: Colors.cyan),
          ),
        ),
      ),
    );
  }
}
