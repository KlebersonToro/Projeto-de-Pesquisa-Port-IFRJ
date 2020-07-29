import 'package:flutter/material.dart';

alert(BuildContext context, String title, String msg,{Function callback}) {
  showDialog(
    context: context,
    builder: (context) {
      //final screenSize = MediaQuery.of(context).size;
      return AlertDialog(
        title: Row(
          children: <Widget>[
            Icon(Icons.error, color: Colors.redAccent, size: 35,),
            SizedBox(width: 10,),
            Text(title, style: TextStyle(color: Colors.black),),
          ],
        ),
        content: Text(msg, style: TextStyle(color: Colors.green, fontSize: 20),),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32),
                color: Colors.green[500],
            ),
            height: 35,
            width: 90,
            child: FlatButton(
              child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 17),),
              onPressed: () {
                Navigator.pop(context);
                if(callback != null) {
                  callback();
                }
              },
            ),
          )
        ],
      );
    },
  );
}