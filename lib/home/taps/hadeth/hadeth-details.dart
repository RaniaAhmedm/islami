import 'package:flutter/material.dart';
import 'package:isslamiii/home/taps/hadeth/hadeth-tap.dart';
import 'package:provider/provider.dart';

import '../../app-provider/app-provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethArgs;
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
              'islami',
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
                Center(
                  child: Text(
                    '${args.title}  ',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
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
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        args.hadethBody,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: provider.appTheme == ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
