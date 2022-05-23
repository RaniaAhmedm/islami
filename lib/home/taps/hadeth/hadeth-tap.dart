import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isslamiii/home/taps/hadeth/hadeth-item.dart';

class HadethTap extends StatefulWidget {
  static const String routeName = 'hadeth-tap';

  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<HadethArgs> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if(hadethList.isEmpty){
      loadHadethFile();
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/hadeth_header.png',
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * .22,
              ),
            ],
          ),
          Container(
            height: 2,
            color: Color.fromARGB(200, 183, 147, 95),
          ),
          Center(
              child: Text(
            'الأحاديث',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          )),
          Container(
            height: 2,
            color: Color.fromARGB(200, 183, 147, 95),
          ),
          Expanded(
            child: (hadethList.isEmpty)
                ? CircularProgressIndicator(
            )
                : ListView.separated(
                    itemBuilder: (_, index) =>
                        HadethItem(hadeth: hadethList[index]),
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Color.fromARGB(90, 183, 147, 95),
                    ),
                    itemCount: hadethList.length,
                  ),
          )
        ],
      ),
    );
  }

  void loadHadethFile() async {
    List<HadethArgs> alHadeth = [];
    String content =
        await rootBundle.loadString('assets/files/hadeth/ahadeth .txt');
    List<String> singleHadeth = content.trim().split('#');
    for (int i = 0; i < singleHadeth.length; i++) {
      List<String> lines = singleHadeth[i].trim().split('\n');
      String title = lines[0];
      if (title.trim().isEmpty) {
        continue;
      }
      lines.removeAt(0);
      String hadethBody = lines.join(' ');
      alHadeth.add(HadethArgs(title: title, hadethBody: hadethBody));
    }
    hadethList = alHadeth;
    setState(() {});
  }
}

class HadethArgs {
  String title;
  String hadethBody;

  HadethArgs({required this.title, required this.hadethBody});
}
