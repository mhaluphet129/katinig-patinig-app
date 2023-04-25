import 'package:flutter/material.dart';
import 'package:katinig_patinig_app/widgets/button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.width * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              label: "Patinig",
              textColor: Colors.black,
              backgroundColor: Colors.grey.withOpacity(0.35),
              fontSize: 20,
              height: 70,
              borderRadius: 10,
              onPress: () {
                Navigator.pushNamed(context, '/patinig');
              },
            ),
            Button(
              label: "Katinig",
              textColor: Colors.black,
              backgroundColor: Colors.grey.withOpacity(0.35),
              fontSize: 20,
              height: 70,
              borderRadius: 10,
              onPress: () {
                Navigator.pushNamed(context, '/katinig');
              },
            ),
            Button(
              label: "About",
              textColor: Colors.black,
              backgroundColor: Colors.grey.withOpacity(0.35),
              fontSize: 20,
              height: 70,
              borderRadius: 10,
            )
          ],
        ),
      )),
    );
  }
}
