import 'package:flutter/material.dart';

class MYBOTTUN extends StatelessWidget {
  MYBOTTUN({
    required this.color,
    required this.titel,
    required this.onpressed,
  });

  final Color color;
  final String titel;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 30,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 350,
          height: 50,
          child: Text(
            titel,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
