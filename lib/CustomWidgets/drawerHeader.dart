import 'package:flutter/material.dart';
import 'package:digishala/constants.dart';

class NCADrawerHeader extends StatelessWidget {
  const NCADrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(color: kThemeColor),
        child: Row(children: [
          CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.13,
              child: Image(
                image: AssetImage('assets/mascot.png'),
              )),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Navodaya',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800,
                    color: Colors.amberAccent)),
            Text('Children\'s',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800,
                    color: Colors.amberAccent)),
            Text('Academy',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.065,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w800,
                    color: Colors.amberAccent)),
            Text('DigiShala',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
          ])
        ]));
  }
}
