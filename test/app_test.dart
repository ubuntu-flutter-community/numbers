import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:numbers/app.dart';
import 'package:numbers/numbers.dart';
import 'package:numbers/settings.dart';
import 'package:numbers/src/pages/math/math_page.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru/yaru.dart';

void main() {
  testWidgets('startup', (tester) async {
    final numbers = MockNumbers();
    const value = Number(found: true, number: 42, text: 'foo', type: 'math');
    when(() => numbers.getMath(any()))
        .thenAnswer((_) async => Result.value(value));
    registerMockService<Numbers>(numbers);

    final settings = MockSettings();
    when(() => settings.theme).thenReturn(ThemeMode.dark);
    when(() => settings.variant).thenReturn(YaruVariant.purple);

    await tester.pumpWidget(
      ChangeNotifierProvider<Settings>.value(
        value: settings,
        child: const NumbersApp(),
      ),
    );

    expect(find.byType(MathPage), findsOneWidget);
    final context = tester.element(find.byType(MathPage));
    expect(Theme.of(context).brightness, equals(Brightness.dark));
    expect(YaruTheme.of(context).variant, equals(YaruVariant.purple));
  });
}

class MockNumbers extends Mock implements Numbers {}

class MockSettings extends Mock implements Settings {}
