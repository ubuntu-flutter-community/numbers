import 'package:flutter/widgets.dart';

class ColorIndicator extends StatelessWidget {
  const ColorIndicator(this.color, {super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: ShapeDecoration(
        color: color,
        shape: const CircleBorder(),
      ),
    );
  }
}
