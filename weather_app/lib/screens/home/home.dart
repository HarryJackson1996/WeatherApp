import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/screens/settings/settings.dart';
import 'package:weather_app/widgets/animated_fab.dart';
import 'package:weather_app/widgets/screen_template.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
 
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
        floatingActionButton: AnimatedFab(),
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: Container(
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color.fromRGBO(197, 225, 165, 1),
              unselectedLabelColor: Colors.black,
              mouseCursor: MouseCursor.uncontrolled,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                ),
                Container(
                  margin: EdgeInsets.only(right: 50),
                  child: Tab(
                    icon: Icon(Icons.bookmark),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Tab(
                    icon: Icon(Icons.search),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                ),
              ],
            ),
          ),
          shape: CircularNotchedRectangle(),
          color: Colors.white,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Page(title: "Screen 1", longDescription: "Template description of screen 1.", color: Colors.white),
            Page(title: "Screen 2", longDescription: "Template description of screen 2.", color: Colors.white),
            ScreenTemplate(
              Container(),
              topPadding: true,
              bottomPadding: true,
            ),
            ScreenTemplate(
              SettingsScreen(),
              topPadding: true,
              bottomPadding: true,
            ),
          ],
        ),
      ),
    );
  }
}

// This widget isn't pertinent to our goals, but it's less boring than looking at plain text
class Page extends StatelessWidget {
  final String title;
  final String longDescription;
  final Color color;

  const Page({this.title, this.longDescription, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
            Text(
              longDescription,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
