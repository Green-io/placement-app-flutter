import 'package:placement_prediction/components/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:placement_prediction/screens/home_screen.dart';
import 'home_page_body.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
                    data != null
                        ? Row(
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
                                data['status'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    data != null
                        ? Row(
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
                                data['salary'].toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        : Center(
                            child: Text(""),
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
