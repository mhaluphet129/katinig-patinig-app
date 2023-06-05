import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// FlutterTts tts = FlutterTts();
AudioPlayer player = AudioPlayer();

class LetterContainer extends StatefulWidget {
  dynamic arguments;
  LetterContainer({Key? key, required this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LetterContainer();
}

class _LetterContainer extends State<LetterContainer>
    with TickerProviderStateMixin {
  double _scaleTransformValue = 1;
  double _opacityTransformValue = 0;
  AnimationController? _animationController;
  AnimationController? animationController;
  AnimationController? animationController2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController!.value);
      });
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.0,
      upperBound: 1.0,
    )..addListener(() {
        setState(() {
          if (_opacityTransformValue > 1.0) {
            animationController2!.stop();
            _opacityTransformValue = 1.0;
          } else {
            _opacityTransformValue = animationController2!.value;
          }
        });
      });
    ;
    // tts.setStartHandler(() {
    //   _animationController!.forward();
    // });
    // tts.setCompletionHandler(() {
    //   _animationController!.reverse();
    // });
    player.onPlayerComplete.listen((e) {
      _animationController!.reverse();
      animationController2!.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    String iconPath = widget.arguments['imagePath'];
    String label = widget.arguments['label'];
    String letter = widget.arguments['letter'];

    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Hero(
                  tag: letter,
                  child: Material(
                      color: Colors.transparent,
                      child: Text(label[0],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 50))),
                )),
                WidgetSpan(
                    child: Text(
                  label.substring(1),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ))
              ])),
              if (player.state == PlayerState.completed)
                Opacity(
                  opacity: _opacityTransformValue,
                  child: Image.asset(
                    'assets/images/$iconPath',
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {
                    print(
                        'audio/${widget.arguments['letter']}/${widget.arguments['label'].toString().toLowerCase()}.m4a');
                    player.stop();
                    player.play(AssetSource(
                        'audio/${widget.arguments['letter']}/${widget.arguments['label'].toString().toLowerCase()}.m4a'));
                    _animationController!.forward();
                    // tts.speak(widget.arguments['label']);
                  },
                  child: AnimatedIcon(
                    size: 60,
                    icon: AnimatedIcons.play_pause,
                    progress: _animationController!,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
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
                          player.stop();
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
              )
            ],
          ))),
    );
  }
}
