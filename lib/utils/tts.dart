import 'package:flutter_tts/flutter_tts.dart';

FlutterTts tts = FlutterTts();

class CustomTTS {
  static String ttsState = '';
  static init() async {
    tts.setLanguage("fil-PH");
    tts.setVolume(1.0);
    tts.setPitch(1.0);
  }

  static speak(String s) {
    tts.speak(s);
  }
}
