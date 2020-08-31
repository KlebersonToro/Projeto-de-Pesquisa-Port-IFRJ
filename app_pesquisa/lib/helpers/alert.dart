import 'package:flutter/material.dart';

choiceAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      //final screenSize = MediaQuery.of(context).size;
      return AlertDialog(
        actions: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(32),
                  color: Colors.blue,
                ),
                height: 35,
                width: 90,
                child: FlatButton(
                  child: Text("Lessons", style: TextStyle(color: Colors.white, fontSize: 15),),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/lessons');  
                  },
                ),
              ),
              Container(width: 90,),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(32),
                  color: Colors.blue,
                ),
                height: 35,
                width: 90,
                child: FlatButton(
                  child: Text("Exercises", style: TextStyle(color: Colors.white, fontSize: 15),),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/exercises');
                      
                  },
                ),
              )
            ],
          )
        ],
      );
    },
  );
}