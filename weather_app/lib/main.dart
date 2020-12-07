import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/providers/theme_provider.dart';
import 'package:weather_app/utils/router_utils.dart' as MyRouter;
import 'consts/routes.dart';
import 'models/theme_models/themes.dart';


void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.transparent
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(ThemeKeyAdapter());
 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),
      ], 
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context, listen: true).themeData,
      title: 'Weather Application',
      onGenerateRoute: MyRouter.Router.generateRoute,
      initialRoute: homeRoute,     
    );
  }
}
