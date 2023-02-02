import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:numbers/services.dart';

void main() {
  setUpAll(() => registerFallbackValue(Uri()));

  test('data', () {
    final json = {
      'text': 'foo bar baz',
      'found': true,
      'number': 42,
      'type': 'math',
    };

    final value = Number.fromJson(json);
    expect(value.toJson(), equals(json));

    final same = Number.fromJson(json);
    expect(value, equals(same));
    expect(value.hashCode, equals(same.hashCode));

    final different = Number.fromJson({
      ...json,
      'number': 123,
    });
    expect(value, isNot(equals(different)));
    expect(value.hashCode, isNot(equals(different.hashCode)));
  });

  test('math', () async {
    final url = Uri.http('numbersapi.com', '/123/math');
    final response = {
      'text': '123 is the number',
      'found': true,
      'number': 123,
      'type': 'math',
    };

    final client = MockHttpClient();
    when(() => client.get(url, headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(json.encode(response), 200));

    final numbers = Numbers(client: client);
    final value = await numbers.getMath(123);
    expect(value.text, equals('123 is the number'));
    expect(value.number, equals(123));
  });

  test('trivia', () async {
    final url = Uri.http('numbersapi.com', '/456/trivia');
    final response = {
      'text': '456 is an uninteresting number',
      'found': true,
      'number': 456,
      'type': 'trivia',
    };

    final client = MockHttpClient();
    when(() => client.get(url, headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(json.encode(response), 200));

    final numbers = Numbers(client: client);
    final value = await numbers.getTrivia(456);
    expect(value.text, equals('456 is an uninteresting number'));
    expect(value.number, equals(456));
  });

  test('year', () async {
    final url = Uri.http('numbersapi.com', '/2023/year');
    final response = {
      'text': '2023 is the year',
      'found': true,
      'number': 2023,
      'type': 'year',
    };

    final client = MockHttpClient();
    when(() => client.get(url, headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(json.encode(response), 200));

    final numbers = Numbers(client: client);
    final value = await numbers.getYear(2023);
    expect(value.text, equals('2023 is the year'));
    expect(value.number, equals(2023));
  });

  test('fail', () async {
    final client = MockHttpClient();
    when(() => client.get(any(), headers: any(named: 'headers')))
        .thenAnswer((_) async => http.Response(json.encode(''), 404));

    final numbers = Numbers(client: client);
    expect(numbers.getYear(789), throwsException);
  });

  test('close', () {
    final client = MockHttpClient();

    final numbers = Numbers(client: client);
    numbers.close();
    verify(() => client.close()).called(1);
  });
}

class MockHttpClient extends Mock implements http.Client {}
