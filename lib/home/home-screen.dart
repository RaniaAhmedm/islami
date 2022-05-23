import 'package:flutter/material.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:isslamiii/home/taps/hadeth/hadeth-tap.dart';
import 'package:isslamiii/home/taps/quran/quran-tap.dart';
import 'package:isslamiii/home/taps/radio/radio-tap.dart';
import 'package:isslamiii/home/taps/sebha/sebha-tap.dart';
import 'package:isslamiii/home/taps/settings/settings.dart';
import 'package:provider/provider.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    QuranTap(),
    SebhaTap(),
    HadethTap(),
    RadioTap(),
    SettingsTap()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getMainBackground(),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_quran.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_sebha.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.tasbeh,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_hadeth.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_radio.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
