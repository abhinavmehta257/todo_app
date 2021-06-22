import 'package:todo_app/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/api/api_service.dart';
import 'package:todo_app/ProgressHUD.dart';
import 'package:todo_app/module/colors.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  SignupRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new SignupRequestModel();
  }

  @override
  Widget build(BuildContext context){
    return ProgressHUD(child: _signupPage(context), inAsyncCall: isApiCallProcess);
  }

  Widget _signupPage(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style:
                            TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: lightBlue),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value)=> !value.contains('@')?'Enter valid Email':null,
                          onSaved: (input) => requestModel.email = input,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightBlue))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (value)=> value.isEmpty?'password cannot be empty':null,
                          onSaved: (input) => requestModel.password = input,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightBlue))),
                          obscureText: true,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (value)=> value.isEmpty?'Name cannot be empty':null,
                          onSaved: (input) => requestModel.name = input,
                          decoration: InputDecoration(
                              labelText: 'NICK NAME ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightBlue))),
                        ),
                        SizedBox(height: 50.0),
                        Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: lightBlue,
                              color: lightBlue,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  if (validateAndSave()) {
                                  setState(() {
                                  isApiCallProcess = true;
                                  });

                                APIService apiService = new APIService();
                                apiService.signup(requestModel).then((value) => {
                                  if(value.user.isNotEmpty){
                                    setState((){
                                    isApiCallProcess = false;
                                    print(value);
                                    }),
                                    // Scaffold.of(context).showSnackBar(SnackBar(content: Text(value.user))),
                                  }else{
                                    setState((){
                                    isApiCallProcess = false;
                                    print(value.error);
                                    }),
                                    // Scaffold.of(context).showSnackBar(SnackBar(content: Text(value.user))),
                                  }
                                });  
                                  print(requestModel.toJson());
                                }
                                },
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: 
                                  Center(
                                    child: Text('Go Back',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                  ),
                              
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ));
  }
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
