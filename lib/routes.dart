import 'package:flutter/material.dart';
import 'package:katinig_patinig_app/screens/home.dart';
import 'package:katinig_patinig_app/screens/katinig.dart';
import 'package:katinig_patinig_app/screens/patinig.dart';
import 'package:katinig_patinig_app/screens/selectedLetter.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(settings.name);
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/katinig':
        return MaterialPageRoute(builder: (_) => Katinig());
      case '/patinig':
        return MaterialPageRoute(builder: (_) => Patinig());
      case '/selected-letter':
        return MaterialPageRoute(
            builder: (_) => SelectedLetter(arguments: args as Map));
      default:
        return _error404();
    }
  }

  static Route<dynamic> _error404() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Please press back again to confirm exit.'),
        ),
      );
    });
  }
}
