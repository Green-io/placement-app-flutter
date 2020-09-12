import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'home_page_body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prognosis App'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.blueGrey[900],
                      Color(0xFF0A0E21).withOpacity(.9),
                    ],
                  ),
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        elevation: 10.0,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Hero(
                            tag: 'prognosis-logo',
                            child: Image.asset(
                              'assets/prognosis-logo.png',
                              width: 90.0,
                              height: 90.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'Prognosis',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomListTile(
                icon: Icons.info,
                iconText: 'About',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InfoPage(),
                    ),
                  );
                },
              ),
              CustomListTile(
                icon: FontAwesomeIcons.github,
                iconText: 'GitHub',
                onTap: () async {
                  var url = 'https://github.com/Green-io';
                  try {
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  } catch (e) {
                    throw '$url cannot launch';
                  }
                },
              ),
            ],
          ),
        ),
        body: HomePageBody(),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String iconText;
  final IconData icon;
  final Function onTap;

  CustomListTile({this.icon, this.iconText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: InkWell(
          splashColor: Colors.lightBlueAccent,
          onTap: onTap,
          child: Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        iconText,
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
