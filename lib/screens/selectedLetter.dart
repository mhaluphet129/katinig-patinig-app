import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:katinig_patinig_app/widgets/button.dart';
import 'package:katinig_patinig_app/utils/constant.dart';

class SelectedLetter extends StatefulWidget {
  dynamic arguments;
  SelectedLetter({Key? key, required this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectedLetter();
}

class _SelectedLetter extends State<SelectedLetter>
    with TickerProviderStateMixin {
  int selectedIndex = -1;
  String ttsState = '';

  double _scaleTransformValue = 1;
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
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
        Hero(
            tag: widget.arguments['letter'],
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                width: 70,
                height: 50,
                child: Button(
                  label: widget.arguments['letter'],
                  textColor: Colors.black,
                  backgroundColor: Colors.grey.withOpacity(0.35),
                  fontSize: 30,
                  disabled: true,
                ))),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * .8,
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Button(
                  label: list[index],
                  textColor: Colors.black,
                  fontSize: 30,
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  borderRadius: 20,
                  backgroundColor: Colors.grey.withOpacity(0.35),
                  onPress: () {
                    // CustomTTS.speak(list[index]);
                    Navigator.pushNamed(context, '/letter-container',
                        arguments: {
                          "letter": widget.arguments['letter'],
                          "label": list[index],
                          "imagePath":
                              '${widget.arguments['letter']}/${list[index]}.png'
                        });
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              }),
        ),
        Transform.scale(
          scale: _scaleTransformValue,
          child: Material(
              type: MaterialType
                  .transparency, //Makes it usable on any background color, thanks @IanSmith
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 2, 157, 155),
                      width: 2.0),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  splashColor: const Color.fromARGB(255, 2, 157, 155),
                  borderRadius: BorderRadius.circular(1000.0),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 30.0,
                      color: Color.fromARGB(255, 2, 157, 155),
                    ),
                  ),
                ),
              )),
        ),
      ]),
    ));
  }
}
