import 'package:flutter/material.dart';
import 'package:todo_app/module/colors.dart';


class taskCard extends StatefulWidget {
  const taskCard({
    Key key,
  }) : super(key: key);

  @override
  _taskCardState createState() => _taskCardState();
}

class _taskCardState extends State<taskCard> {
  final String task = "complete linux file";
  int selectedradio = 0;
 

  @override
  Widget build(BuildContext context) {
    bool _value = false;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        height: 60,
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child:Center(
          child: InkWell(
          onTap: () {
            setState(() {
              _value = !_value;
            });
          },
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _value
                  ? Icon(
                      Icons.check,
                      size: 30.0,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      size: 30.0,
                      color: Colors.blue,
                    ),
            ),
          ),

        // child: RadioListTile(
        //   contentPadding: EdgeInsets.zero,
        //     value: 1,
        //     groupValue: selectedradio,
        //     onChanged: (value) {
        //       setState(() {
        //         selectedradio == 1 ? selectedradio = null : selectedradio = 1 ; 
        //       });
        //     },
        //    activeColor: pink,
        //     title:Text(
        //     task,
        //     style: TextStyle(color: darkmain),
        //     ),
        //   ),
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
