import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:numbers/numbers.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class NumberView extends StatelessWidget {
  const NumberView({super.key, required this.number, required this.result});

  final int number;
  final Result<Number>? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            child: Center(
              key: ValueKey(number),
              child: Text(
                number.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            child: Align(
              alignment: Alignment.topCenter,
              child: result.when(
                loading: () => const YaruCircularProgressIndicator(),
                success: (value) => Text(value.text),
                error: (error) => Text(error.toString()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

extension on Result<Number>? {
  T when<T>({
    required T Function() loading,
    required T Function(Number) success,
    required T Function(Object) error,
  }) {
    final that = this;
    if (that == null) {
      return loading();
    } else if (that.isError) {
      return error(that.asError!.error);
    } else {
      return success(that.asValue!.value);
    }
  }
}
