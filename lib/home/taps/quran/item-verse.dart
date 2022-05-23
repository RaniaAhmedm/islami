import 'package:flutter/material.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:provider/provider.dart';

class ItemVerse extends StatelessWidget {
  String text;
  int index;

  ItemVerse({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '$text {$index}',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: provider.appTheme == ThemeMode.light
              ? Colors.black
              : Colors.white,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
