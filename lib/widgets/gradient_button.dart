import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String img;
  final double? size;
  const GradientButton({super.key, required this.img, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
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
