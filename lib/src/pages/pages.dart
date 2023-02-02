import 'package:flutter/widgets.dart';

import 'math/math_page.dart';
import 'trivia/trivia_page.dart';
import 'year/year_page.dart';

class PageBuilder {
  const PageBuilder({
    required this.iconBuilder,
    required this.titleBuilder,
    required this.pageBuilder,
  });

  final WidgetBuilder iconBuilder;
  final WidgetBuilder titleBuilder;
  final WidgetBuilder pageBuilder;
}

const pages = [
  PageBuilder(
    iconBuilder: MathPage.buildIcon,
    titleBuilder: MathPage.buildTitle,
    pageBuilder: MathPage.buildDetail,
  ),
  PageBuilder(
    iconBuilder: TriviaPage.buildIcon,
    titleBuilder: TriviaPage.buildTitle,
    pageBuilder: TriviaPage.buildDetail,
  ),
  PageBuilder(
    iconBuilder: YearPage.buildIcon,
    titleBuilder: YearPage.buildTitle,
    pageBuilder: YearPage.buildDetail,
  ),
];
