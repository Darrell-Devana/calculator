import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final String operator;
  final int color;
  final Function()? tap;

  const Button2({
    super.key,
    required this.operator,
    required this.color,
    this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: 160,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(color),
              borderRadius: BorderRadius.circular(40)),
          child: InkWell(
            onTap: tap,
            child: Center(
              child: Text(
                operator,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: CupertinoColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
