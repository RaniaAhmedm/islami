import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:isslamiii/home/taps/settings/language-bottom-sheet.dart';
import 'package:isslamiii/home/taps/settings/theme-bottom-sheet.dart';

import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .04,
          vertical: MediaQuery.of(context).size.height * .06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(vertical: 7),
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en' ? 'English' : 'العربية',
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),
                  Icon(Icons.arrow_drop_down_sharp,color:Colors.black,)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(vertical: 7),
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme == ThemeMode.light ? 'Light' : 'Dark',
                    style: TextStyle(
                        fontSize: 15, color: Theme.of(context).primaryColor),
                  ),
                  Icon(Icons.arrow_drop_down_sharp,color:Colors.black,)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
