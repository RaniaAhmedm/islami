import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isslamiii/home/taps/quran/item-verse.dart';
import 'package:provider/provider.dart';

import '../../app-provider/app-provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    var provider = Provider.of<AppProvider>(context);

    if (verses.isEmpty) {
      loadFile(args.suraIndex);
    }

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
              'Islami',
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.light
                  ? Colors.white.withOpacity(.8)
                  : Color.fromARGB(255, 50, 60, 98),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'سورة ${args.suraName}  ',
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          ?.copyWith(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      color: provider.appTheme == ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 2,
                  color: Color.fromARGB(80, 183, 147, 95),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: Container(
                  child: verses.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 4,
                          ),
                          itemBuilder: (context, index) => ItemVerse(
                              text: verses[index].trim(), index: index + 1),
                          itemCount: verses.length,
                        ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void loadFile(int indexFile) async {
    String content =
        await rootBundle.loadString('assets/files/${indexFile + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int suraIndex;

  SuraDetailsArgs({required this.suraName, required this.suraIndex});
}
