import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_port/models/page_manager.dart';
import 'package:test_port/models/user_manager.dart';

// ignore: must_be_immutable
class DrawerTile extends StatelessWidget {

  DrawerTile({this.iconData,this.page,this.title,this.isLogOut = false,this.dColor});

  final IconData iconData;
  final String title;
  final int page;
  final Color dColor;
  bool isLogOut = false;

  @override
  Widget build(BuildContext context) {

    final int pagAtual = context.watch<PageManager>().page;
    final Color primaryColor = Theme.of(context).primaryColor;

    if(isLogOut)
      return logOut(
        ctx: context,
        iconData: iconData,
        color: dColor,
        title: title
      );
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

Widget logOut({@required BuildContext ctx, iconData, color, title}){

  return InkWell(
      onTap: (){
        Navigator.of(ctx).pushNamedAndRemoveUntil('/base', (route) => false);
        //ctx.read<PageManager>().setPage(0);
        ctx.read<UserManager>().signOut();
      },

      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(6, 0, 24, 0),
              child: Icon(
                iconData,
                size: 32,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: color,
              ),
            )
          ],
        ),
      ),
    );

}
