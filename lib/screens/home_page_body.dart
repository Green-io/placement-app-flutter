import 'dart:convert';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_prediction/components/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:placement_prediction/screens/results_screen.dart';

String x;
String y;
String z;
String a;
String b;
String c;
String d;
String e;
String fdata;
var data;
//var salary;
//var status;

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final _formKey = GlobalKey<FormState>();

  var url =
      "https://placement-app.herokuapp.com/api?ssc_p=80&hsc_p=80&degree_p=80&etest_p=80&mba_p=70&gender_M=0&degree_t=0&workex_Yes=0";
//  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
    print(data);
  }

  formValidator() {
    if (_formKey.currentState.validate()) {
      print("Validation Success");
//      web(x, y, z, a, b, c, d, e);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResultPage()));
    } else {
      print("Validation Error");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomTextField(
                    labelText: 'Secondary School Percentage', //validation
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      x = val;
                    },
                  ),
                  CustomTextField(
                    labelText: 'High School Percentage', //validation
//                    validator: (validate) =>
//                        validate.length == 0 ? "Required" : null,

                    keyboardType: TextInputType.number,
                    onChanged: (val2) {
                      y = val2;
                    },
                  ),
                  CustomTextField(
                    labelText: 'UG Degree Percentage', //validation
//                    validator: (validate) =>
//                        validate.length == 0 ? "Required" : null,

                    keyboardType: TextInputType.number,
                    onChanged: (val3) {
                      z = val3;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Placement Eligibility Test Score',
                    keyboardType: TextInputType.number,
                    onChanged: (val4) {
                      a = val4;
                    },
                  ),
                  CustomTextField(
                    labelText: 'MBA Percentage',
                    keyboardType: TextInputType.number,
                    onChanged: (val5) {
                      b = val5;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Gender',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text('Female'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                    value: null,
                                    groupValue: null,
                                    onChanged: null),
                              ),
                            ),
                            Text('Male'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                    value: null,
                                    groupValue: null,
                                    onChanged: null),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'UG Degree in B.Tech. or B.Sc.',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text('Yes'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                    value: null,
                                    groupValue: null,
                                    onChanged: null),
                              ),
                            ),
                            Text('No'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                    value: null,
                                    groupValue: null,
                                    onChanged: null),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                'Work Experience',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text('Yes'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                    value: null,
                                    groupValue: null,
                                    onChanged: null),
                              ),
                            ),
                            Text('No'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                    value: null,
                                    groupValue: null,
                                    onChanged: null),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: formValidator,
                        child: Text(
                          'Predict',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
