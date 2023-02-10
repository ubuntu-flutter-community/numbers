import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

import 'settings.dart';
import 'settings_widgets.dart';

Future<void> showSettingsDialog({
  required BuildContext context,
  WidgetBuilder? themePreviewBuilder,
}) {
  return showDialog(
    context: context,
    builder: (context) => SettingsDialog(
      themePreviewBuilder: themePreviewBuilder,
    ),
  );
}

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key, this.themePreviewBuilder});

  final WidgetBuilder? themePreviewBuilder;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          YaruDialogTitleBar(
            title: Text(l10n.settingsDialogTitle),
          ),
          Padding(
            padding: const EdgeInsets.all(kYaruPagePadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: ThemeSelector(
                    previewBuilder: themePreviewBuilder,
                    theme: context.select((Settings s) => s.theme),
                    onChanged: context.read<Settings>().setTheme,
                  ),
                ),
                const SizedBox(height: kYaruPagePadding),
                VariantSelector(
                  variant: YaruTheme.of(context).variant,
                  onChanged: context.read<Settings>().setVariant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
