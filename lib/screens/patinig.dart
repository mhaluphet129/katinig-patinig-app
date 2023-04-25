import 'package:flutter/material.dart';
import 'package:katinig_patinig_app/utils/constant.dart';
import 'package:katinig_patinig_app/widgets/button.dart';

class Patinig extends StatelessWidget {
  Patinig({Key? key}) : super(key: key);

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: List.generate(patinig.length, (index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      width: 70,
                      height: 50,
                      child: Button(
                        label: patinig[index],
                        rightIcon: Icons.volume_up_rounded,
                        rightIconSize: 20,
                        textColor: Colors.black,
                        backgroundColor: Colors.grey.withOpacity(0.35),
                        fontSize: 30,
                        onPress: () {
                          Navigator.pushNamed(context, '/selected-letter',
                              arguments: {"letter": patinig[index]});
                        },
                      ));
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
                type: MaterialType
                    .transparency, //Makes it usable on any background color, thanks @IanSmith
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(1000.0),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
