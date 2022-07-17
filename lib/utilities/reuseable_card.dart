import 'package:flutter/material.dart';


class reusableCard extends StatelessWidget {
  reusableCard({
    required this.colour,
    this.cardChild,
    this.onPress,
  });

  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(25.0),
        ),
        margin: EdgeInsets.all(10.0),
      ),
    );
  }
}
