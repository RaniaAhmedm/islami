import 'package:flutter/material.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:isslamiii/model/RadioResponse.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  Radios item;
  Function play;
  Function pause;
  RadioItem(this.item, this.play, this.pause);

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.09),
            child: Text(
              '${widget.item.name}',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: provider.appTheme == ThemeMode.light
                      ? Color.fromARGB(255, 58, 57, 57)
                      : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  widget.play(widget.item.radioUrl);
                },
                icon: Icon(Icons.play_arrow),
                color: provider.appTheme == ThemeMode.light
                    ? Color.fromARGB(255, 183, 147, 95)
                    : Color.fromARGB(255, 250, 204, 29),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {
                  widget.pause();
                },
                icon: Icon(Icons.pause),
                color: provider.appTheme == ThemeMode.light
                    ? Color.fromARGB(255, 183, 147, 95)
                    : Color.fromARGB(255, 250, 204, 29),
                iconSize: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
