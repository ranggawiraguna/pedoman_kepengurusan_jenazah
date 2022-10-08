import 'package:flutter/material.dart';

class DecorationPage extends StatelessWidget {
  const DecorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.width * 0.06,
          right: 0,
          child: Image.asset(
            'assets/DecorationPageRightA.png',
            width: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width * 0.55,
          right: MediaQuery.of(context).size.width * 0.05,
          child: Image.asset(
            'assets/DecorationPageRightB.png',
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width * 0.45,
          left: 0,
          child: Image.asset(
            'assets/DecorationPageLeft.png',
            width: MediaQuery.of(context).size.width * 0.22,
          ),
        ),
      ],
    );
  }
}
