import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:numbers/numbers.dart';
import 'package:numbers/src/pages/math/math_model.dart';
import 'package:numbers/src/pages/math/math_page.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

void main() {
  testWidgets('load at init', (tester) async {
    final model = mockModel(number: 0);

    await tester.pumpWidget(buildPage(model));

    verify(() => model.load(any(that: isPositive))).called(1);
  });

  testWidgets('show progress indicator while loading', (tester) async {
    final model = mockModel(number: 0, value: null);

    await tester.pumpWidget(buildPage(model));

    expect(find.byType(YaruCircularProgressIndicator), findsOneWidget);
  });

  testWidgets('present number', (tester) async {
    const value = Number(found: true, number: 123, text: 'foo', type: 'math');
    final result = Result.value(value);
    final model = mockModel(number: 123, value: result);

    await tester.pumpWidget(buildPage(model));

    expect(find.text('123'), findsOneWidget);
    expect(find.text('foo'), findsOneWidget);
  });

  testWidgets('reload random number', (tester) async {
    final model = mockModel(number: 0);

    await tester.pumpWidget(buildPage(model));
    verify(() => model.load(any(that: isPositive))).called(1);

    await tester.tap(find.byIcon(YaruIcons.refresh));
    await tester.pump();
    verify(() => model.load(any(that: isPositive))).called(1);
  });

  testWidgets('error', (tester) async {
    final error = Result<Number>.error('err');
    final model = mockModel(number: 123, value: error);

    await tester.pumpWidget(buildPage(model));

    expect(find.text('123'), findsOneWidget);
    expect(find.text('err'), findsOneWidget);
  });
}

class MockMathModel extends Mock implements MathModel {}

MockMathModel mockModel({required int number, Result<Number>? value}) {
  final model = MockMathModel();
  when(() => model.number).thenReturn(number);
  when(() => model.value).thenReturn(value);
  when(() => model.load(any())).thenAnswer((_) async {});
  return model;
}

Widget buildPage(MathModel model) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    home: ChangeNotifierProvider<MathModel>.value(
      value: model,
      child: const MathPage(),
    ),
  );
}
