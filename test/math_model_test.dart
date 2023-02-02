import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:numbers/services.dart';
import 'package:numbers/src/pages/math/math_model.dart';

void main() {
  test('load', () async {
    const value = Number(found: true, number: 123, text: 'foo', type: 'math');

    final numbers = MockNumbers();
    when(() => numbers.getMath(123)).thenAnswer((_) async => value);

    final model = MathModel(numbers);
    expect(model.number, equals(0));

    final wasNotified = <Number?>[];
    model.addListener(() => wasNotified.add(model.value));

    await model.load(123);
    expect(model.number, equals(123));
    expect(model.value, equals(value));
    expect(wasNotified, equals([value]));
  });
}

class MockNumbers extends Mock implements Numbers {}
