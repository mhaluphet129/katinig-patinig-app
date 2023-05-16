import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:katinig_patinig_app/widgets/button.dart';
import "package:katinig_patinig_app/utils/constant.dart";

AudioPlayer player = AudioPlayer();

class Katinig extends StatefulWidget {
  Katinig({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Katinig();
}

class _Katinig extends State<Katinig> with TickerProviderStateMixin {
  double _scaleTransformValue = 1;
  late final AnimationController animationController;
  List<AnimationController>? _animationController;
  int selectedIndex = -1;

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
    _animationController = katinig
        .map((x) => AnimationController(
            vsync: this, duration: const Duration(milliseconds: 450)))
        .toList();

    player.onPlayerComplete.listen((e) {
      _animationController![selectedIndex].reverse();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Katinig', style: TextStyle(fontSize: 25)),
            const Text('sa', style: TextStyle(fontSize: 25)),
            const Text('Alpabetong Filipino ', style: TextStyle(fontSize: 25)),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: List.generate(katinig.length, (index) {
                  return SizedBox(
                      width: 120,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                                tag: katinig[index],
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: 70,
                                    height: 50,
                                    child: Button(
                                      label: katinig[index],
                                      textColor: Colors.black,
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.35),
                                      fontSize: 30,
                                      onPress: () {
                                        Navigator.pushNamed(
                                            context, '/selected-letter',
                                            arguments: {
                                              "letter": katinig[index]
                                            });
                                      },
                                    ))),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10)),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (selectedIndex != -1) {
                                        _animationController![selectedIndex]
                                            .reset();
                                      }
                                      setState(() {
                                        selectedIndex = index;
                                      });

                                      if (index == selectedIndex) {
                                        _animationController![index].forward();
                                      }

                                      player.stop();
                                      print(
                                          'audio/KATINIG/${katinig[index].toUpperCase()}.m4a');
                                      player.play(AssetSource(
                                          'audio/KATINIG/${katinig[index].toUpperCase()}.m4a'));

                                      // tts.speak(widget.arguments['label']);
                                    },
                                    child: AnimatedIcon(
                                      size: 45,
                                      icon: AnimatedIcons.play_pause,
                                      progress: _animationController![index],
                                    ),
                                  ),
                                )),
                          ]));
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Transform.scale(
              scale: _scaleTransformValue,
              child: Material(
                  type: MaterialType.transparency,
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
                        animationController.forward();
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () {
                            animationController.reverse();
                            Navigator.pop(context);
                          },
                        );
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
          ],
        ),
      ),
    ));
  }
}
