import 'package:flutter/material.dart';
import 'package:katinig_patinig_app/widgets/button.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  final Color textColor = const Color(0xFFDBAD3F);
  final Offset shadowOffset = const Offset(2.0, 2.0);
  final double strokeWidth = 2;
  int selectedIndex = -1;

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
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .8,
        child: Column(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/random/app_logo.png',
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 0,
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: const Text(
                            'v1.0',
                            style: TextStyle(
                                fontFamily: 'Comic',
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    Text(
                      'Pagbasa',
                      style: TextStyle(
                        fontSize: 40,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = strokeWidth
                          ..color = textColor,
                      ),
                    ),
                    Text('Pagbasa',
                        style: TextStyle(
                            fontSize: 40,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                            shadows: [
                              Shadow(
                                offset: shadowOffset,
                                blurRadius: 3.0,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: shadowOffset,
                                blurRadius: 8.0,
                                color: const Color.fromARGB(125, 0, 0, 255),
                              ),
                            ]))
                  ],
                ),
                Text('sa',
                    style: TextStyle(
                        height: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: textColor,
                        shadows: [
                          Shadow(
                            offset: shadowOffset,
                            blurRadius: 3.0,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: shadowOffset,
                            blurRadius: 8.0,
                            color: const Color.fromARGB(125, 0, 0, 255),
                          ),
                        ])),
                Stack(
                  children: [
                    Text(
                      'Marungko',
                      style: TextStyle(
                        fontSize: 40,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = strokeWidth
                          ..color = textColor,
                      ),
                    ),
                    Text('Marungko',
                        style: TextStyle(
                            fontSize: 40,
                            height: 1,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                            shadows: [
                              Shadow(
                                offset: shadowOffset,
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: shadowOffset,
                                blurRadius: 8.0,
                                color: const Color.fromARGB(125, 0, 0, 255),
                              ),
                            ]))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: selectedIndex == 0 ? _scaleTransformValue : 1,
                    child: Button(
                      label: "Patinig",
                      textColor: textColor,
                      fontSize: 30,
                      height: 60,
                      width: 180,
                      borderRadius: 100,
                      fontWeight: FontWeight.w700,
                      border: Border.all(color: textColor, width: 3.0),
                      splashColor: textColor,
                      shadow: [
                        Shadow(
                          offset: shadowOffset,
                          blurRadius: 3.0,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: shadowOffset,
                          blurRadius: 8.0,
                          color: const Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],
                      onPress: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                        animationController.forward();
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () {
                            animationController.reverse();
                            Navigator.pushNamed(context, '/patinig');
                          },
                        );
                      },
                    ),
                  ),
                  Transform.scale(
                    scale: selectedIndex == 1 ? _scaleTransformValue : 1,
                    child: Button(
                      label: "Katinig",
                      textColor: textColor,
                      fontSize: 30,
                      height: 60,
                      width: 180,
                      borderRadius: 100,
                      border: Border.all(color: textColor, width: 3.0),
                      fontWeight: FontWeight.w700,
                      splashColor: textColor,
                      shadow: [
                        Shadow(
                          offset: shadowOffset,
                          blurRadius: 3.0,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: shadowOffset,
                          blurRadius: 8.0,
                          color: const Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],
                      onPress: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                        animationController.forward();
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () {
                            animationController.reverse();
                            Navigator.pushNamed(context, '/katinig');
                          },
                        );
                      },
                    ),
                  ),
                  Transform.scale(
                    scale: selectedIndex == 2 ? _scaleTransformValue : 1,
                    child: Button(
                      label: "About",
                      textColor: textColor,
                      fontSize: 30,
                      height: 60,
                      width: 180,
                      borderRadius: 100,
                      fontWeight: FontWeight.w700,
                      border: Border.all(color: textColor, width: 3.0),
                      splashColor: textColor,
                      shadow: [
                        Shadow(
                          offset: shadowOffset,
                          blurRadius: 3.0,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        Shadow(
                          offset: shadowOffset,
                          blurRadius: 8.0,
                          color: const Color.fromARGB(125, 0, 0, 255),
                        ),
                      ],
                      onPress: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                        animationController.forward();
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () => animationController.reverse(),
                        );
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                  Text('Developer',
                                      style: TextStyle(fontSize: 20)),
                                  Text(
                                    'Kit Symmon Kessey L. Rojas',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Image Referece',
                                      style: TextStyle(fontSize: 20)),
                                  Text(
                                    'https://www.flaticon.com',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Version',
                                      style: TextStyle(fontSize: 20)),
                                  Text(
                                    '1.0',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ]));
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
