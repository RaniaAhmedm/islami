import 'package:flutter/material.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatefulWidget {
  static const String routeName = 'sebha-tap';

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int sebhaCounter = 0;
  List<String> azkar = [
    'سُبْحَانَ اللَّهِ',
    'لَا إلَه إلّا اللهُ',
    'الْلَّهُ أَكْبَرُ',
    'أستغفر الله',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
  ];
  int azkarIndex = 0;
  double angle = 0.0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image.asset(
                'assets/images/head_of_seb7a.png',
                fit: BoxFit.fill,
              ),
              InkWell(
                onTap: () {
                  onSebhaClicked();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08,
                      bottom: MediaQuery.of(context).size.height * 0.04),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      'assets/images/body_of_seb7a.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: provider.appTheme == ThemeMode.light
                      ? Color.fromARGB(255, 55, 55, 55)
                      : Colors.white,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: provider.appTheme == ThemeMode.light
                  ? Color.fromARGB(255, 192, 170, 136)
                  : Color.fromARGB(100, 3, 8, 26),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$sebhaCounter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: provider.appTheme == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 183, 147, 95),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              ' ${azkar[azkarIndex]}',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void onSebhaClicked() {
    sebhaCounter++;
    if (sebhaCounter % 33 == 0) {
      azkarIndex++;
    }
    if (sebhaCounter % 165 == 0) {
      azkarIndex = 0;
    }
    setState(() {
      angle += 180;
    });
  }
}
