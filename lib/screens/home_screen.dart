import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_prediction/components/custom_dialog_box.dart';
import 'package:placement_prediction/components/custom_text_field.dart';
import 'package:http/http.dart' as http;

String x;
String y;
String z;
String a;
String b;
String c;
String d;
String e;
var fdata;
var salary;
var status;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  web(server, osname, imagename, volhost, volcon, sourceport, destport,
      contnamedel) async {
    //print(cmd);
    var url =
        'https://placement-app.herokuapp.com/api?ssc_p=80&hsc_p=80&degree_p=80&etest_p=80&mba_p=70&gender_M=0&degree_t=0&workex_Yes=0';
    var r = await http.get(url);
    setState(() {
      var data = r.body;
      
    });
    print(data.runtimeType);
    print(data['salary']);
    print(data['status']);
  }

  formValidator() {
    if (_formKey.currentState.validate()) {
      print("Validation Success");
      web(x, y, z, a, b, c, d, e);
      showDialog(
          context: context,
          builder: (context) => CustomDialogBox(
                title: "Result",
                desc: fdata ?? "Wait for Output",
              ));
    } else {
      print("Validation Error");
    }
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CustomTextField(
                    labelText: 'Server-IP', //validation
//                    validator: (validate) =>
//                        validate.length == 0 ? "Required" : null,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      x = val;
                    },
                  ),
                  CustomTextField(
                    labelText: 'OS Name', //validation
//                    validator: (validate) =>
//                        validate.length == 0 ? "Required" : null,
                    obscureText: false,
                    onChanged: (val2) {
                      y = val2;
                    },
                  ),
                  CustomTextField(
//                    labelText: 'Image Name', //validation
//                    validator: (validate) =>
//                        validate.length == 0 ? "Required" : null,
                    obscureText: false,
                    onChanged: (val3) {
                      z = val3;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Volume of Host to mount',
                    obscureText: false,
                    onChanged: (val4) {
                      a = val4;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Volume of Container',
                    obscureText: false,
                    onChanged: (val5) {
                      b = val5;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Source Port For PATing', //validation
                    keyboardType: TextInputType.number,
//                    validator: (validate) =>
//                        validate.length == 0 ? "Between 0 to 65535" : null,
                    obscureText: false,
                    onChanged: (val6) {
                      c = val6;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Destination Port for PATing', //validation
                    keyboardType: TextInputType.number,
//                    validator: (validate) =>
//                        validate.length == 0 ? "Between 0 to 65535" : null,
                    obscureText: false,
                    onChanged: (val7) {
                      d = val7;
                    },
                  ),
                  CustomTextField(
                    labelText: 'Name of Container to delete',
                    obscureText: false,
                    onChanged: (val8) {
                      e = val8;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: formValidator,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
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
