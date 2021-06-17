import 'package:flutter/material.dart';
import 'package:todo_app/module/colors.dart';
import 'package:todo_app/widgets/taskCard.dart';
import 'package:todo_app/widgets/todoList.dart';
import 'package:todo_app/widgets/topBody.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto'
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("pressed");
        },
        ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.menu_rounded,
          color: Colors.black,
          ),
        backgroundColor: Colors.white,
        elevation: 0
      ),
      body: Column(
        children: [
          topBody(),
          SizedBox(
            height: 330,
            width:  MediaQuery.of(context).size.width,
            child: todoList(),
          )
        ],
      ),      
    );
  }
}
