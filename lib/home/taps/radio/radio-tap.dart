import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isslamiii/home/app-provider/app-provider.dart';
import 'package:isslamiii/model/RadioResponse.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'radio-item.dart';

class RadioTap extends StatefulWidget {
  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  late Future<RadioResponse> radioResponces;
  late AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radioResponces = fetchRadio();
    audioPlayer = AudioPlayer();
  }

  play(String url) async {
    await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return FutureBuilder<RadioResponse>(
        future: radioResponces,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.radios![0].name);
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/radio_icon.png',
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .3,
                  ),
                ),
                Text(
                  'إذاعة القرآن الكريم',
                  style: TextStyle(
                      color: provider.appTheme == ThemeMode.light
                          ? Color.fromARGB(255, 58, 57, 57)
                          : Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data?.radios!.length,
                      itemBuilder: (_, index) {
                        return RadioItem(
                            snapshot.data!.radios![index], play, pause);
                      }),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: IconButton(
                onPressed: () {
                  radioResponces = fetchRadio();
                },
                icon: Icon(Icons.refresh),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<RadioResponse> fetchRadio() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RadioResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
