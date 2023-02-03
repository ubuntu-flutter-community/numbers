import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:numbers/numbers.dart';
import 'package:numbers/src/pages/math/math_model.dart';

void main() {
  test('load', () async {
    const value = Number(found: true, number: 123, text: 'foo', type: 'math');
    final result = Result.value(value);

    final numbers = MockNumbers();
    when(() => numbers.getMath(123)).thenAnswer((_) async => result);

    final model = MathModel(numbers);
    expect(model.number, equals(0));

    final wasNotified = <Result<Number>?>[];
    model.addListener(() => wasNotified.add(model.value));

    await model.load(123);
    expect(model.number, equals(123));
    expect(model.value, equals(result));
    expect(wasNotified, equals([result]));
  });

  test('error', () async {
    final numbers = MockNumbers();
    final error = Result<Number>.error('err');

    when(() => numbers.getMath(123)).thenAnswer((_) async => error);

    final model = MathModel(numbers);
    expect(model.number, equals(0));

    final wasNotified = <Result<Number>?>[];
    model.addListener(() => wasNotified.add(model.value));

    await model.load(123);
    expect(model.number, equals(123));
    expect(model.value, error);
    expect(wasNotified, equals([error]));
  });
}

class MockNumbers extends Mock implements Numbers {}
