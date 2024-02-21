import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String operator;
  final int color;
  final int fontColor;
  final Function()? tap;

  const Button({
    super.key,
    required this.operator,
    required this.color,
    required this.fontColor,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(color),
          ),
          child: InkWell(
            onTap: tap,
            child: Center(
              child: Text(
                operator,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: Color(fontColor)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
