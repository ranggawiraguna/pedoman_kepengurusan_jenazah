import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final String imageUrl;
  final double widthFactor;
  final Function() onPressed;

  const ButtonMenu({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    this.widthFactor = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width * 0.035),
            ),
          ),
          elevation: 0,
        ),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
