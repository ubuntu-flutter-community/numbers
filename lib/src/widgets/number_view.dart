import 'package:flutter/material.dart';
import 'package:numbers/services.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class NumberView extends StatelessWidget {
  const NumberView({super.key, required this.number, required this.data});

  final int number;
  final Number? data;

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
              child: data == null
                  ? const YaruCircularProgressIndicator()
                  : Text(data!.text),
            ),
          ),
        ),
      ],
    );
  }
}
