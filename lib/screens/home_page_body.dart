import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_prediction/components/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'wait_for_result.dart';

int x = 0;
int y = 0;
int z = 0;
int a = 0;
int b = 0;
var data;
int gender = 0;
int degree = 0;
int work = 0;

//var salary;
//var status;

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final _formKey = GlobalKey<FormState>();
  web(ssp, hsp, ugp, pets, mbap) async {
    var url =
        //"https://prognosis-app.herokuapp.com/api?ssc_p=80&hsc_p=80&degree_p=80&etest_p=80&mba_p=70&gender_M=0&degree_t=0&workex_Yes=0";
        "https://prognosis-app.herokuapp.com/api?ssc_p=${ssp}&hsc_p=${hsp}&degree_p=${ugp}&etest_p=${pets}&mba_p=${mbap}&gender_M=${gender}&degree_t=${degree}&workex_Yes=${work}";
//  var data;

    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
    print(data);
    print(url);
  }

  @override
  void initState() {
    super.initState();
  }

  formValidator() {
    if (_formKey.currentState.validate()) {
      print("Validation Success");

      web(x, y, z, a, b);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WaitingScreen()));
    } else {
      print("Validation Error");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _radioValue1 = -1;
  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          gender = 0;
          break;
        case 1:
          gender = 1;
          break;
      }
    });
  }

  int _radioValue3 = -1;
  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          work = 0;
          break;
        case 1:
          work = 1;
          break;
      }
    });
  }

  int _radioValue2 = -1;
  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          degree = 0;
          break;
        case 1:
          degree = 1;
          break;
      }
    });
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
                      x = int.parse(val);
                      print(x);
                    },
                  ),
                  CustomTextField(
                    labelText: 'High School Percentage', //validation
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,

                    keyboardType: TextInputType.number,
                    onChanged: (val2) {
                      y = int.parse(val2);
                      print(y);
                    },
                  ),
                  CustomTextField(
                    labelText: 'UG Degree Percentage', //validation
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,

                    keyboardType: TextInputType.number,
                    onChanged: (val3) {
                      z = int.parse(val3);
                      print(z);
                    },
                  ),
                  CustomTextField(
                    labelText: 'Placement Eligibility Test Score',
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,
                    keyboardType: TextInputType.number,
                    onChanged: (val4) {
                      a = int.parse(val4);
                      print(a);
                    },
                  ),
                  CustomTextField(
                    labelText: 'MBA Percentage',
                    keyboardType: TextInputType.number,
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,
                    onChanged: (val5) {
                      b = int.parse(val5);
                      print(b);
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
                                  value: 0,
                                  groupValue: _radioValue1,
                                  onChanged: _handleRadioValueChange1,
                                ),
                              ),
                            ),
                            Text('Male'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                  value: 1,
                                  groupValue: _radioValue1,
                                  onChanged: _handleRadioValueChange1,
                                ),
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
                                  value: 0,
                                  groupValue: _radioValue2,
                                  onChanged: _handleRadioValueChange2,
                                ),
                              ),
                            ),
                            Text('No'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                  value: 1,
                                  groupValue: _radioValue2,
                                  onChanged: _handleRadioValueChange2,
                                ),
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
                                  value: 0,
                                  groupValue: _radioValue3,
                                  onChanged: _handleRadioValueChange3,
                                ),
                              ),
                            ),
                            Text('No'),
                            Flexible(
                              child: ListTile(
                                leading: Radio(
                                  value: 1,
                                  groupValue: _radioValue3,
                                  onChanged: _handleRadioValueChange3,
                                ),
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
                        color: Color(0xFF0A0E21),
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
