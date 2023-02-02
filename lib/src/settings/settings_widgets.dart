import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:numbers/settings.dart';
import 'package:numbers/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'settings_l10n.dart';

class ThemePopupMenuButton extends StatelessWidget {
  const ThemePopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.select((Settings s) => s.theme) ?? ThemeMode.system;
    return YaruPopupMenuButton(
      initialValue: theme,
      itemBuilder: (context) => [
        for (final value in ThemeMode.values)
          PopupMenuItem(
            value: value,
            child: Text(value.localize(context)),
          ),
      ],
      onSelected: context.read<Settings>().setTheme,
      child: Text(theme.localize(context)),
    );
  }
}

class ColorPopupMenuButton extends StatelessWidget {
  const ColorPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final variant = YaruTheme.of(context).variant;
    return YaruPopupMenuButton(
      constraints: const BoxConstraints(maxHeight: 320),
      initialValue: variant,
      itemBuilder: (context) => [
        for (final value in YaruVariant.values)
          PopupMenuItem(
            value: value,
            child: ColorIndicator(value.color),
          ),
      ],
      onSelected: context.read<Settings>().setVariant,
      child: ColorIndicator(variant?.color),
    );
  }
}

class LanguagePopupMenuButton extends StatelessWidget {
  const LanguagePopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return YaruPopupMenuButton(
      initialValue: locale,
      itemBuilder: (context) => [
        for (final value in AppLocalizations.supportedLocales)
          PopupMenuItem(
            value: value,
            child: Text(value.toLanguageTag()),
          ),
      ],
      onSelected: context.read<Settings>().setLocale,
      child: Text(locale.toLanguageTag()),
    );
  }
}
