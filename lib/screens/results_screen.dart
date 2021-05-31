import 'package:placement_prediction/components/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:placement_prediction/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class ResultPage extends StatefulWidget {
  final String url;
  ResultPage({@required this.url});

  @override
  _ResultPageState createState() => _ResultPageState(this.url);
}

class _ResultPageState extends State<ResultPage> {
  final String url;
  _ResultPageState(this.url);
  String responseBody = "";
  dynamic parsedValue;
  bool loading;

  Future<void> getData(String url) async {
    try {
      final http.Response response = await http.get(url);
      final parsed = await compute(jsonDecode, response.body);
      print("parsed json object= $parsed");
      setState(() {
        this.responseBody = response.body;
        this.parsedValue = parsed;
      });
    } catch (e) {
      setState(() {
        print(e);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    this.getData(url).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topCenter,
                child: Text(
                  'Predicted Result',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: CustomContainer(
                colour: Color(0xFF1D1E33),
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Placement Status: ',
                                style: TextStyle(
                                  color: Colors.lightGreenAccent,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                parsedValue['status'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                    loading
                        ? Center(
                            child: Text(
                              "Calculating...",
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Expected Salary (in LPA): ',
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                parsedValue['salary'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            ButtonTheme(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                color: Colors.lightBlue,
                child: Text(
                  'Re-calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
