import 'package:flutter/material.dart';

const Alignment alignmentTopLeft = Alignment.topLeft;
const Alignment alignmentBottomRight = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child});
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.purple,
          ],
          begin: alignmentTopLeft,
          end: alignmentBottomRight,
        ),
      ),
      child: child,
    );
  }
}