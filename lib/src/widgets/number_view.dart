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
          flex: 1,
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
          flex: 2,
          child: AnimatedSwitcher(
            duration: kThemeAnimationDuration,
            child: data == null
                ? const Center(child: YaruCircularProgressIndicator())
                : Center(child: Text(data!.text)),
          ),
        ),
      ],
    );
  }
}
