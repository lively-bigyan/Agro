import 'dart:io';
import 'package:agro/constants/constant.dart';
import 'package:agro/pages/aboutpage.dart';
import 'package:agro/pages/category_page.dart';
import 'package:agro/pages/newspage.dart';
import 'package:agro/querypage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:line_icons/line_icons.dart';

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;

  MainMenu(this.signOut);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String email = "", name = "", id = "";
  TabController tabController;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("id");
      email = preferences.getString("email");
      name = preferences.getString("name");
    });
    print("id" + id);
    print("user" + email);
    print("name" + name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(letterSpacing: 2),
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.dribbble.com/users/1422682/screenshots/4540686/_______7-100.jpg'),
                ),
              ),
              accountName: Text('$name',
                  style: TextStyle(backgroundColor: Colors.green[400])),
              accountEmail: Text(' $email ',
                  style: TextStyle(backgroundColor: Colors.green[400])),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/girl.png'),
              ),
            ),
            ListTile(
                title: Text(
                  'Talk to Expert',
                  style: kTileTitleStyle,
                ),
                dense: true,
                leading: Icon(
                  LineIcons.question_circle,
                  color: iconColor,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddData(value: email)));
                }),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('Categories', style: kTileTitleStyle),
                leading: Icon(
                  LineIcons.pagelines,
                  color: iconColor,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CategoryPage()));
                }),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('Library', style: kTileTitleStyle),
                leading: Icon(
                  LineIcons.book,
                  color: iconColor,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {}),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('News', style: kTileTitleStyle),
                leading: Icon(
                  LineIcons.newspaper_o,
                  color: iconColor,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsPage()));
                }),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('Schedule', style: kTileTitleStyle),
                leading: Icon(LineIcons.calendar, color: iconColor),
                trailing: Icon(Icons.arrow_right),
                onTap: () {}),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('About Us', style: kTileTitleStyle),
                leading: Icon(LineIcons.linux, color: iconColor),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                }),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('Log Out', style: kTileTitleStyle),
                leading: Icon(LineIcons.sign_out),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  signOut();
                }),
            GreenDivider(),
            ListTile(
                dense: true,
                title: Text('Exit App', style: kTileTitleStyle),
                leading: Icon(
                  LineIcons.power_off,
                  color: Colors.red,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  exit(0);
                }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'HELLO',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
    /* Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: Icon(Icons.lock_open),
          )
        ],
      ),
      body: Center(
        child: Text(
          "WelCome",
          style: TextStyle(fontSize: 30.0, color: Colors.blue),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        iconSize: 30.0,
//        iconSize: MediaQuery.of(context).size.height * .60,
        currentIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
          selectedIndex = 'TAB: $currentIndex';
//            print(selectedIndex);
          reds(selectedIndex);
        },

        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color(0xFFf7d426)),
          BottomNavyBarItem(
              icon: Icon(Icons.view_list),
              title: Text('List'),
              activeColor: Color(0xFFf7d426)),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Color(0xFFf7d426)),
        ],
      ),
    ); */
  }

  callToast(String msg) {
    Fluttertoast.showToast(
        msg: "$msg",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green[200],
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
