import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'settings_dialog.dart';

class SettingsBar extends StatelessWidget {
  const SettingsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Material(
      color: Theme.of(context).colorScheme.background,
      shape: Border(top: Divider.createBorderSide(context)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: YaruMasterTile(
          leading: const Icon(YaruIcons.gear),
          title: Text(l10n.settingsDialogTitle),
          onTap: () => showSettingsDialog(context: context),
        ),
      ),
    );
  }
}
