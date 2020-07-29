import 'package:flutter/material.dart';
import 'package:test_port/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {

  DrawerTile({this.iconData, this.page, this.title});

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {

    final int pagAtual = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: (){
        context.read<PageManager>().setPage(page);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6, 0, 24, 0),
              child: Icon(
                iconData,
                size: 32,
                color: pagAtual == page ? primaryColor : Colors.grey,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: pagAtual == page ? primaryColor : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}