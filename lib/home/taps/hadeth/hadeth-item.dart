import 'package:flutter/material.dart';
import 'package:isslamiii/home/taps/hadeth/hadeth-details.dart';
import 'hadeth-tap.dart';
class HadethItem extends StatelessWidget {
  HadethArgs hadeth;

  HadethItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routeName,
          arguments:
              HadethArgs(title: hadeth.title, hadethBody: hadeth.hadethBody),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Text(
            '${hadeth.title}',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.normal, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
