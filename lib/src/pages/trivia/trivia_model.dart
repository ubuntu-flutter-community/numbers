import 'package:async/async.dart';
import 'package:numbers/services.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class TriviaModel extends SafeValueNotifier<Result<Number>?> {
  TriviaModel(this._numbers) : super(null);

  final Numbers _numbers;

  int get number => _number;
  int _number = 0;

  Future<void> load(int number) async {
    _number = number;
    value = null;
    value = await _numbers.getTrivia(number);
  }
}
