import 'package:flutter/material.dart';

class DelimealDrawerItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final Function onTap;

  const DelimealDrawerItem({
    @required this.icon,
    @required this.title,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 5),
      height: 80,
      alignment: Alignment.centerLeft,
      color: Theme.of(context).primaryColorLight,
      child: ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 20,
            fontWeight: FontWeight.w300
          ),),
        onTap: onTap,
      ),
    );
  }
}
