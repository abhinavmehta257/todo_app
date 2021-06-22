import 'package:flutter/material.dart';
import 'package:todo_app/module/colors.dart';
import 'package:circular_check_box/circular_check_box.dart';

class taskCard extends StatefulWidget {
  bool isCompleted;
  String task;
  taskCard({
    Key key,
    this.isCompleted,
    this.task
  }) : super(key: key);

  @override
  _taskCardState createState() => _taskCardState(key:this.key, isCompleted: this.isCompleted, task:this.task);
}

class _taskCardState extends State<taskCard> {
  Key key;
  String task;
  bool isCompleted;
  String type = 'personal';
  _taskCardState({this.key,this.isCompleted,this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
      child:Container(
          height: 60,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading:CircularCheckBox(
              value: isCompleted,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onChanged: (bool x) {
                setState(() {
                  isCompleted = !isCompleted;
                });
              },
              activeColor: type == 'business' ? pink : lightBlue,
              inactiveColor: type == 'business' ? pink : lightBlue,
            ),
            title:Text.rich(TextSpan(
                  text:task,
                  style: isCompleted ? TextStyle(
                    color: lightBlue,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3
                    ) :TextStyle(
                    color: darkmain,
                    )
                )
              ),
            ),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(10)
                ),
                boxShadow:[ 
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: .5, //spread radius
                      blurRadius: 10, // blur radius
                      offset: Offset(0, 1), // changes position of shadow
                  ),
                  ],
              ),
        ),
    );
  }
}
