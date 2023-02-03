import 'package:async/async.dart';
import 'package:numbers/numbers.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class MathModel extends SafeValueNotifier<Result<Number>?> {
  MathModel(this._numbers) : super(null);

  final Numbers _numbers;

  int get number => _number;
  int _number = 0;

  Future<void> load(int number) async {
    _number = number;
    value = null;
    value = await _numbers.getMath(number);
  }
}
