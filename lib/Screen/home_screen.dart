import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappsss/Screen/listview_gridview.dart';
import 'package:flutterappsss/Screen/login_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:flutterappsss/Screen/share_all_media.dart';
import 'package:flutterappsss/Screen/esys_photo_share.dart';
import 'slider_carousel.dart';
import 'listview_gridview.dart';
import 'esys_photo_share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _title;

  final List<Widget> _children = [
    Demo(),
    ListViewGridView(),
    DemoApp(),
    Photo(),
  ];

  @override
  void initState() {
    _title = 'Home Page';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[_simplePopup()],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: TitledBottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
          TitledNavigationBarItem(title: Text('List'), icon: Icons.list),
          TitledNavigationBarItem(title: Text('Share'), icon: Icons.share),
          TitledNavigationBarItem(
              title: Text('All'), icon: Icons.folder_shared),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          _drawerheader(),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      )),
    );
  }

  Widget _simplePopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text("First"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Second"),
          ),
        ],
      );
  Widget _drawerheader() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return DrawerHeader(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    AssetImage('assets/images/drawer_header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Learn Flutter By Abhishek",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700))),
        ]));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'HomeScreen';
          }
          break;
//        case 1:
//          {
//            _title = 'Table Calender';
//          }
//          break;
        case 1:
          {
            _title = 'ListView & TextView';
          }
          break;
        case 2:
          {
            _title = 'Share Only Text ';
          }
          break;
        case 3:
          {
            _title = 'Share Plugin Use';
          }
          break;

        default:
      }
    });
  }
}
