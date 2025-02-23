import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? padding;

  const MyButtons({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor ??
          Colors.deepOrange[200], // Default color if not provided
      padding:
          EdgeInsets.all(padding ?? 16.0), // Default padding if not provided
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color:
              textColor ?? Colors.black, // Default text color if not provided
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
