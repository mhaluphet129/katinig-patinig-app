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
              onPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Image.asset(
                            'assets/images/random/app_logo.png',
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          const Text('Pagbasa sa Marungko',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900)),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text('Developer',
                              style: TextStyle(fontSize: 20)),
                          const Text(
                            'Kit Symmon Kessey L. Rojas',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Image Referece',
                              style: TextStyle(fontSize: 20)),
                          const Text(
                            'https://www.flaticon.com',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Version', style: TextStyle(fontSize: 20)),
                          const Text(
                            '1.0',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ]));
                  },
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
