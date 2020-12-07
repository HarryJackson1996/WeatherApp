import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherProvider with ChangeNotifier {

  static WeatherProvider of(BuildContext context, {bool listen = false}) {
    return Provider.of<WeatherProvider>(context, listen: listen);
  } 

  
  
}
