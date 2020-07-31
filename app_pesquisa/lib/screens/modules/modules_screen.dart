import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/helpers/alert.dart';
import 'package:test_port/models/modules_manager.dart';
import 'package:test_port/screens/modules/module_tile.dart';

class ModulesScreen extends StatefulWidget {
  @override
  _ModulesScreenState createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModulesManager>(
      builder: (_, modulesManager, __){
        return ListView.builder(
            itemCount: modulesManager.allModules.length,
            itemBuilder: (context, index) {
              return ModuleTile(alertCtx: context, module: modulesManager.allModules[index],);
            });
      },
    );
  }

  /* Widget buildCards(context, index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: InkWell(
          child: Padding(
              padding: EdgeInsets.all(12),
              child: ListTile(
                title: ,
              )
              ),
          onTap: () {
            alert(
              context,
            );
          },
        ),
      ),
    );
  } */
}
