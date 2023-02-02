import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numbers/widgets.dart';

void main() {
  final colorVariant = ValueVariant({
    Colors.red,
    Colors.green,
    Colors.blue,
  });

  testWidgets('golden', (tester) async {
    final color = colorVariant.currentValue!;
    await tester.pumpWidget(
      Center(
        child: RepaintBoundary(
          child: ColorIndicator(color),
        ),
      ),
    );

    final hex = color.value.toRadixString(16).padLeft(8, '0');
    await expectLater(
      find.byType(ColorIndicator),
      matchesGoldenFile('goldens/color-indicator-$hex.png'),
    );
  }, variant: colorVariant);
}
