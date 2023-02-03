import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' as http;
import 'package:meta/meta.dart';

class Numbers {
  Numbers({@visibleForTesting http.Client? client})
      : _client = client ?? http.RetryClient(http.Client());

  final http.Client _client;

  void close() => _client.close();

  Future<Result<Number>> getMath(int number) {
    return Result.capture(_getNumber('/$number/math'));
  }

  Future<Result<Number>> getTrivia(int number) {
    return Result.capture(_getNumber('/$number/trivia'));
  }

  Future<Result<Number>> getYear(int year) {
    return Result.capture(_getNumber('/$year/year'));
  }

  Future<Number> _getNumber(String path) async {
    final url = Uri.http('numbersapi.com', path, {'json': ''});
    return _client.get(url).then((response) {
      if (response.statusCode == 200) {
        return Number.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception('${response.reasonPhrase} (${response.statusCode})');
      }
    });
  }
}

@immutable
class Number {
  const Number({
    required this.text,
    required this.found,
    required this.number,
    required this.type,
    this.date,
    this.year,
  });

  final String text;
  final bool found;
  final num number;
  final String type;
  final String? date;
  final String? year;

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'found': found,
      'number': number,
      'type': type,
      if (date != null) 'date': date,
      if (year != null) 'year': year,
    };
  }

  factory Number.fromJson(Map<String, dynamic> json) {
    return Number(
      text: json['text'],
      found: json['found'],
      number: json['number'],
      type: json['type'],
      date: json['date'],
      year: json['year'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Number &&
        other.text == text &&
        other.found == found &&
        other.number == number &&
        other.type == type &&
        other.date == date &&
        other.year == year;
  }

  @override
  int get hashCode => Object.hash(text, found, number, type, date, year);

  @override
  String toString() {
    return 'Number(text: $text, found: $found, number: $number, type: $type, date: $date, year: $year)';
  }
}
