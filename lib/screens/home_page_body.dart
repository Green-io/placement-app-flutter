import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_prediction/components/custom_text_field.dart';
import 'package:placement_prediction/screens/results_screen.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  TextEditingController secondarySchoolController,
      highSchoolController,
      ugDegreeController,
      placementTestController,
      mbaPercentageController;

  int secondarySchoolPercent = 0;
  int highSchoolPercent = 0;
  int ugDegreePercent = 0;
  int placementTestPercent = 0;
  int mbaPercent = 0;
  int gender = 0;
  int degree = 0;
  int workExp = 0;

  String URL;

  final _formKey = GlobalKey<FormState>();
  getURL(ssp, hsp, ugp, pets, mbap) {
    var url =
        "https://prognosis-app.herokuapp.com/api?ssc_p=${ssp}&hsc_p=${hsp}&degree_p=${ugp}&etest_p=${pets}&mba_p=${mbap}&gender_M=${gender}&degree_t=${degree}&workex_Yes=${workExp}";
    setState(() {
      URL = url;
    });
    print(url);
  }

  @override
  void initState() {
    super.initState();
    this.secondarySchoolController = TextEditingController();
    this.highSchoolController = TextEditingController();
    this.ugDegreeController = TextEditingController();
    this.placementTestController = TextEditingController();
    this.mbaPercentageController = TextEditingController();
  }

  formValidator() {
    if (_formKey.currentState.validate()) {
      print("Validation Success");
      setState(() {
        secondarySchoolPercent = int.parse(secondarySchoolController.text);
        highSchoolPercent = int.parse(highSchoolController.text);
        ugDegreePercent = int.parse(ugDegreeController.text);
        placementTestPercent = int.parse(placementTestController.text);
        mbaPercent = int.parse(mbaPercentageController.text);
      });

      getURL(secondarySchoolPercent, highSchoolPercent, ugDegreePercent,
          placementTestPercent, mbaPercent);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultPage(
                    url: URL,
                  )));
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
          workExp = 0;
          break;
        case 1:
          workExp = 1;
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
                    textInputAction: TextInputAction.next,
                    controller: secondarySchoolController,
                  ),
                  CustomTextField(
                    labelText: 'High School Percentage', //validation
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,

                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: highSchoolController,
                  ),
                  CustomTextField(
                    labelText: 'UG Degree Percentage', //validation
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,

                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: ugDegreeController,
                  ),
                  CustomTextField(
                    labelText: 'Placement Eligibility Test Score',
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: placementTestController,
                  ),
                  CustomTextField(
                    labelText: 'MBA Percentage',
                    keyboardType: TextInputType.number,
                    validator: (validate) =>
                        validate.length == 0 ? "Required" : null,
                    textInputAction: TextInputAction.done,
                    controller: mbaPercentageController,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
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
