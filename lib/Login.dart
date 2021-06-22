import 'package:flutter/material.dart';
import 'package:todo_app/ProgressHUD.dart';
import 'package:todo_app/api/api_service.dart';
import 'package:todo_app/module/colors.dart';

import 'model/login_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  LoginRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context){
    return ProgressHUD(child: _loginPage(context), inAsyncCall: isApiCallProcess);
  }

  Widget _loginPage(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 120.0, 0.0, 0.0),
                      child: Text(
                        'DoIt',
                        style: TextStyle(
                        fontSize: 80.0, fontWeight: FontWeight.bold)
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(165.0, 122.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: lightBlue)),
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
                          onSaved: (input) => requestModel.email = input,
                          validator: (input) => !input.contains('@')
                              ? "Enter a valid Email"
                              : null,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightBlue))),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input,
                          validator: (input) => input.isEmpty
                              ? 'Password cannot be empty'
                              : null,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightBlue))),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          height: 40.0,
                          child: GestureDetector(
                            onTap: () {
                              if (validateAndSave()) {
                                setState(() {
                                isApiCallProcess = true;
                                });

                              APIService apiService = new APIService();
                              apiService.login(requestModel).then((value) => {
                                
                                if(value.apiKey.isNotEmpty){
                                  setState((){
                                  isApiCallProcess = false;
                                  Navigator.pushReplacementNamed(context, '/dashboard');
                                  }),
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Login successful'),
                                      ),
                                    ),
                                  print(value.apiKey)
                                }else{
                                  setState((){
                                  isApiCallProcess = false;
                                  print(value.error);
                                  }),
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('server error'),
                                      ),
                                    ),
                                }
                              });  
                                print(requestModel.toJson());
                              }
                            },
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: lightBlue,
                              color: lightBlue,
                              elevation: 7.0,
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  )),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New to DoIt ?',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: lightBlue,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
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
