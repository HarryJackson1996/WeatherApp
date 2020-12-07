import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;

  SearchTextField({
    this.controller,
    this.hintText = ""
  }) : assert(controller != null);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
     return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.0, color: Colors.transparent),
          ),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          labelStyle: TextStyle(color: Colors.blue),
          hintText: widget.hintText,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Color.fromRGBO(0, 34, 69, 1),
          )
        ),
        onSubmitted: (String value) {
          //SearchProvider.of(context, listen: false).setSearchkeyword(value);
        },
      ),
    );
  }
}