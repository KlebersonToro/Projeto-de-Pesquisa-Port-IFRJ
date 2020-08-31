import 'package:flutter/material.dart';
import 'package:test_port/helpers/alert.dart';
import 'package:test_port/models/module.dart';

class ModuleTile extends StatelessWidget {

  const ModuleTile({this.module,this.alertCtx});

  final Module module;
  final BuildContext alertCtx;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: InkWell(
          child: Padding(
              padding: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.library_books),
                title: Text(module.title),
                subtitle: Text(module.desc),
                
              )
              ),
          onTap: () {
            choiceAlert(
              alertCtx,
            );
          },
        ),
      ),
    );
  }
}