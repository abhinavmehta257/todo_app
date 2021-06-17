import 'package:flutter/material.dart';
import 'package:todo_app/module/colors.dart';

class topBody extends StatelessWidget {
  const topBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 50, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Text(
            'What\'s up, Abhinav',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color:darkmain,
              fontFamily: 'Roboto',
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Text(
              'CATEGORIES',
              style: TextStyle(color: lightBlue),
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 140,
                height: 70,
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
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Business',
                        style: TextStyle(
                          color: darkmain,
                          fontSize: 24,
                          ),
                        ),
                        Container(
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                            color: pink
                          ),
                        )
                    ],
                  )
                  ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Personal',
                        style: TextStyle(
                          color: darkmain,
                          fontSize: 24
                          ),
                        )
                      ),
                      Container(
                          height: 3,
                          width: 100,
                          decoration: BoxDecoration(
                            color: lightBlue
                          ),
                        )
                  ],
                ),
                margin: EdgeInsets.all(20),
                width: 140,
                height: 70,
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
                    
                )
              ),
            ],
          ),
          

        ],
      ),
    );
  }
}