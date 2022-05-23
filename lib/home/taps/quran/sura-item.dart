import 'package:flutter/material.dart';
import 'package:isslamiii/home/taps/quran/sura-details.dart';

class SuraItem extends StatelessWidget {
  String suraName;
  int index;

  SuraItem({required this.suraName, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: SuraDetailsArgs(suraName: suraName, suraIndex: index));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          suraName,
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
