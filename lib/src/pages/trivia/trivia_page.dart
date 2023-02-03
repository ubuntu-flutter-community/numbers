import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:numbers/numbers.dart';
import 'package:numbers/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'trivia_model.dart';

class TriviaPage extends StatefulWidget {
  const TriviaPage({super.key});

  static Widget buildIcon(BuildContext context) {
    return const Icon(YaruIcons.book);
  }

  static Widget buildTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Text(l10n.triviaPageTitle);
  }

  static Widget buildDetail(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TriviaModel(getService<Numbers>()),
      child: const TriviaPage(),
    );
  }

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  int randomInt() => Random().nextInt(1979);

  @override
  void initState() {
    super.initState();
    context.read<TriviaModel>().load(42);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TriviaModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kYaruPagePadding),
        child: NumberView(number: model.number, result: model.value),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<TriviaModel>().load(randomInt()),
        child: const Icon(YaruIcons.refresh),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
