import 'dart:convert';

import 'package:todo_app/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/taskCard.dart';
import 'package:http/http.dart' as http;

class todoList extends StatefulWidget {

  @override
  _todoListState createState() => _todoListState();
}


class _todoListState extends State<todoList> {

  // APIService apiService;

  Future<List> _future = null;
  
  Future<List> getdata() async{
    var uriResponse;
    List taskList;
      uriResponse = await http.get(Uri.parse('https://reqres.in/api/user?page=2'), headers: {"Accept": "application/json"});
    taskList = jsonDecode(uriResponse.body)['data'];
    if (uriResponse.statusCode == 200){
      return taskList;
    }else {
      throw Exception('Failed to load data! responce: ${uriResponse}');
    }
  }
  @override
  void initState(){
    super.initState();
    _future = getdata();
    print("future: ${_future}");
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder <List>(
      future:  _future,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            shrinkWrap: true,
            children: snapshot.data.map((task) => taskCard(isCompleted: false, task: task['name'],)).toList(),
          );
        } else {
          return Center(
            child: Container(
              width: 50,
              height: 50,
              child: CircularProgressIndicator()
              ),
          );
        }
      });
  }
}
