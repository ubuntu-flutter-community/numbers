import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:numbers/numbers.dart';
import 'package:numbers/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'year_model.dart';

class YearPage extends StatefulWidget {
  const YearPage({super.key});

  static Widget buildIcon(BuildContext context) {
    return const Icon(YaruIcons.calendar);
  }

  static Widget buildTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Text(l10n.yearPageTitle);
  }

  static Widget buildDetail(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => YearModel(getService<Numbers>()),
      child: const YearPage(),
    );
  }

  @override
  State<YearPage> createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  int get currentYear => DateTime.now().year;
  int get randomYear => Random().nextInt(currentYear);

  @override
  void initState() {
    super.initState();
    context.read<YearModel>().load(currentYear);
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<YearModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kYaruPagePadding),
        child: NumberView(number: model.year, result: model.value),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<YearModel>().load(randomYear),
        child: const Icon(YaruIcons.refresh),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
