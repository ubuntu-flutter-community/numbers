import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:numbers/services.dart';
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
              child: result == null
                  ? const YaruCircularProgressIndicator()
                  : result!.isError
                      ? Text(result!.asError!.error.toString())
                      : Text(result!.asValue!.value.text),
            ),
          ),
        ),
      ],
    );
  }
}
