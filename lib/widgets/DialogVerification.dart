import 'package:flutter/material.dart';

class DialogVerification {
  DialogVerification({
    required BuildContext context,
    required String description,
    required List<String> action,
    required List<void Function(BuildContext contextDialog)> actionPressed,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext contextDialog) => AlertDialog(
        title: const SizedBox.shrink(),
        content: Text(
          description,
          style: const TextStyle(),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => actionPressed[0](contextDialog),
            child: Text(
              action[0],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => actionPressed[1](contextDialog),
            child: Text(
              action[1],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
