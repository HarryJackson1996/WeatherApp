import 'package:flutter/material.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/screens/search/widgets/search_text_field.dart';

class SearchScreen extends StatelessWidget {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: ThemeProvider.of(context).themeData.backgroundColor,
      appBar: AppBar(
        backgroundColor: ThemeProvider.of(context).themeData.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeProvider.of(context).themeData.primaryColor,
          ),
          onPressed: () {
            if(Navigator.canPop(context)) {
              Navigator.pop(context);
            } 
          },
        ),
      ),
      body:  SearchTextField(
        controller: _controller,
        hintText: "Search",
      ),
    );
  }
}