import 'package:flutter/material.dart';
import 'package:todo_app/widgets/taskCard.dart';

class todoList extends StatefulWidget {

  @override
  _todoListState createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        shrinkWrap: true,
        children:<Widget> [
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),
          taskCard(),

        ],
    );
  }
}
