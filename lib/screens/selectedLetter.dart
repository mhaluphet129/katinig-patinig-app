import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:katinig_patinig_app/utils/tts.dart';
import 'package:katinig_patinig_app/widgets/button.dart';
import 'package:katinig_patinig_app/utils/constant.dart';

FlutterTts tts = FlutterTts();

class SelectedLetter extends StatefulWidget {
  dynamic arguments;
  SelectedLetter({Key? key, required this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectedLetter();
}

class _SelectedLetter extends State<SelectedLetter> {
  int selectedIndex = -1;
  String ttsState = '';

  @override
  void initState() {
    tts.setStartHandler(() {
      setState(() {
        ttsState = 'playing';
      });
    });
    tts.setCompletionHandler(() {
      setState(() {
        ttsState = '';
        selectedIndex = -1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = patinig.contains(widget.arguments['letter'])
        ? patinigList[widget.arguments['letter']]!.split(' ')
        : katinigList[widget.arguments['letter']]!.split(' ');
    return Scaffold(
        body: Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            width: 70,
            height: 50,
            child: Button(
              label: widget.arguments['letter'],
              textColor: Colors.black,
              backgroundColor: Colors.grey.withOpacity(0.35),
              fontSize: 30,
              disabled: true,
            )),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * .7,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Button(
                  label: ttsState == 'playing' && selectedIndex == index
                      ? ""
                      : list[index],
                  rightIconSize:
                      ttsState == 'playing' && selectedIndex == index ? 50 : 30,
                  backgroundColor:
                      ttsState == 'playing' && selectedIndex == index
                          ? Colors.grey
                          : Colors.grey.withOpacity(0.35),
                  imagePath: ttsState == 'playing' && selectedIndex == index
                      ? '${widget.arguments['letter']}/${list[index]}.png'
                      : null,
                  rightIcon: Icons.volume_up_rounded,
                  textColor: Colors.black,
                  fontSize: 30,
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  borderRadius: 20,
                  onPress: () {
                    CustomTTS.speak(list[index]);
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              }),
        ),
        Material(
            type: MaterialType
                .transparency, //Makes it usable on any background color, thanks @IanSmith
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2.0),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
      ]),
    ));
  }
}
