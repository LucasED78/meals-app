import 'package:flutter/material.dart';

class DelimealDrawerTitle extends StatelessWidget {

  final String title;

  const DelimealDrawerTitle({
    @required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Theme.of(context).primaryColor,
      alignment: Alignment.centerLeft,
      child: Text(title, style: Theme.of(context).textTheme.title,),
    );
  }
}
