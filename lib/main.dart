import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:isslamiii/home/home-screen.dart';
import 'package:isslamiii/home/taps/hadeth/hadeth-details.dart';
import 'package:isslamiii/home/taps/hadeth/hadeth-tap.dart';
import 'package:isslamiii/home/taps/quran/quran-tap.dart';
import 'package:isslamiii/home/taps/quran/sura-details.dart';
import 'package:isslamiii/my-theme.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return AppProvider();
      },
      child: MyApplication()));
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami_App',
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranTap.routeName: (context) => QuranTap(),
        HadethTap.routeName: (context) => HadethTap(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
    );
  }
}
