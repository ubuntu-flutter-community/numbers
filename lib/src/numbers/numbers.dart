import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' as http;
import 'package:meta/meta.dart';

import 'number.dart';

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
