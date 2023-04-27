import 'package:flutter/material.dart';
import 'package:katinig_patinig_app/screens/home.dart';
import 'package:katinig_patinig_app/screens/katinig.dart';
import 'package:katinig_patinig_app/screens/letter_container.dart';
import 'package:katinig_patinig_app/screens/patinig.dart';
import 'package:katinig_patinig_app/screens/selectedLetter.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/katinig':
        return MaterialPageRoute(builder: (_) => Katinig());
      case '/patinig':
        return MaterialPageRoute(builder: (_) => Patinig());
      case '/selected-letter':
        return MaterialPageRoute(
            builder: (_) => SelectedLetter(arguments: args as Map));
      case '/letter-container':
        return MaterialPageRoute(
            builder: (_) => LetterContainer(arguments: args as Map));
      default:
        return _error404();
    }
  }

  static Route<dynamic> _error404() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error in the App.'),
        ),
      );
    });
  }
}
