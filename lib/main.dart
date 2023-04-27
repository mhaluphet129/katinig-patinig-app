import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:katinig_patinig_app/routes.dart';
import 'package:katinig_patinig_app/utils/tts.dart';

FlutterTts tts = FlutterTts();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CustomTTS.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagbasa sa Marungko',
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFFFFDD0),
          fontFamily: 'Comic'),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
