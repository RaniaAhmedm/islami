import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeAppTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: selectedThemeRow(
                  'Light', provider.appTheme == ThemeMode.light)),
          InkWell(
              onTap: () {
                provider.changeAppTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: selectedThemeRow(
                  'Dark', provider.appTheme == ThemeMode.dark)),
        ],
      ),
    );
  }

  Widget selectedThemeRow(String theme, bool isSelected) {
    if (isSelected) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              theme,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
      );
    } else
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              theme,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
  }
}
