import 'package:async/async.dart';
import 'package:numbers/numbers.dart';
import 'package:safe_change_notifier/safe_change_notifier.dart';

class YearModel extends SafeValueNotifier<Result<Number>?> {
  YearModel(this._numbers) : super(null);

  final Numbers _numbers;

  int get year => _year;
  int _year = 0;

  Future<void> load(int year) async {
    _year = year;
    value = null;
    value = await _numbers.getYear(year);
  }
}
