import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = Colors.amberAccent,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
