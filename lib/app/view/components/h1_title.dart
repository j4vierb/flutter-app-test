import 'package:flutter/material.dart';

class H1Title extends StatelessWidget {
  const H1Title(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: color
      ),
    );
  }
}
