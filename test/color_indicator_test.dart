import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numbers/widgets.dart';

void main() {
  testWidgets('size', (tester) async {
    await tester.pumpWidget(const Center(child: ColorIndicator(Colors.red)));
    expect(find.byType(ColorIndicator), findsOneWidget);

    expect(
      tester.getSize(find.byType(DecoratedBox)),
      isA<Size>()
          .having((s) => s.width, 'width', isPositive)
          .having((s) => s.height, 'height', isPositive),
    );
  });

  testWidgets('color and shape', (tester) async {
    await tester.pumpWidget(const Center(child: ColorIndicator(Colors.red)));
    expect(find.byType(ColorIndicator), findsOneWidget);

    expect(
      tester.widget<DecoratedBox>(find.byType(DecoratedBox)).decoration,
      isA<ShapeDecoration>()
          .having((d) => d.color, 'color', equals(Colors.red))
          .having((d) => d.shape, 'shape', isA<CircleBorder>()),
    );
  });
}
