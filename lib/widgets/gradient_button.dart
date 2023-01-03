import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String img;
  const GradientButton({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ellipse.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Image.asset(img),
    );
  }
}
