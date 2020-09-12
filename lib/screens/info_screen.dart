import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 200),
                        Text(
                          'Prognosis',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: Color(0xff144087),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Flutter App',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: Color(0xFF0A0E21),
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          color: Color(0xff14B5EB),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Prognosis is an AI based Placement and Salary Predictor tool that enables MBA candidates to gain insight about possibilities of getting placed and average salary expectancy using factors such as academic details, gender, and work experience etc.'
                          'This single page application, developed using Flask and Flutter, can be run on any android platform to get the output instantaneously. It aids to bridge the gap between the recruiters and the candidates.',
                          maxLines: 14,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xff384C54),
//                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(
                          color: Color(0xff14B5EB),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'A Make In India 🇮🇳 Initiative',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Created By',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1489B2),
                            ),
                          ),
                          Text(
                            'Green.io',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 21.0,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: -5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    child: Hero(
                      tag: 'prognosis-logo',
                      child: Image.asset(
                        'assets/prognosis-logo.png',
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
