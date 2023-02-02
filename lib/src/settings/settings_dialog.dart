import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'settings_widgets.dart';

Future<void> showSettingsDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) => const SettingsDialog(),
  );
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: YaruDialogTitleBar(
        title: Text(l10n.settingsDialogTitle),
      ),
      contentPadding: const EdgeInsets.all(kYaruPagePadding / 2),
      content: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(kYaruPagePadding / 2),
                child: Text(l10n.themeLabel),
              ),
              const Padding(
                padding: EdgeInsets.all(kYaruPagePadding / 2),
                child: ThemePopupMenuButton(),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(kYaruPagePadding / 2),
                child: Text(l10n.colorLabel),
              ),
              const Padding(
                padding: EdgeInsets.all(kYaruPagePadding / 2),
                child: ColorPopupMenuButton(),
              ),
            ],
          ),
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(kYaruPagePadding / 2),
                child: Text(l10n.languageLabel),
              ),
              const Padding(
                padding: EdgeInsets.all(kYaruPagePadding / 2),
                child: LanguagePopupMenuButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
