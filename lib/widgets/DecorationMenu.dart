import 'package:flutter/material.dart';

class DecorationMenu extends StatelessWidget {
  const DecorationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.width * 0.06,
          right: 0,
          child: Image.asset(
            'assets/DecorationMenuRight.png',
            width: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width * 0.45,
          left: 0,
          child: Image.asset(
            'assets/DecorationMenuLeft.png',
            width: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
      ],
    );
  }
}
