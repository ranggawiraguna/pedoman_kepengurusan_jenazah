import 'package:flutter/material.dart';

class ButtonActionContent extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;

  const ButtonActionContent(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(0, 0),
        padding: const EdgeInsets.all(5),
        backgroundColor: const Color(0xFFFFC000),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: MediaQuery.of(context).size.width * 0.06,
      ),
    );
  }
}
