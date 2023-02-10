import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    super.key,
    ThemeMode? theme,
    this.previewBuilder,
    required this.onChanged,
  }) : theme = theme ?? ThemeMode.system;

  final ThemeMode theme;
  final WidgetBuilder? previewBuilder;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: YaruBanner(
            padding: EdgeInsets.zero,
            selected: theme == ThemeMode.system,
            onTap: () => onChanged(ThemeMode.system),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                ThemeCard(
                  title: Text(l10n.systemTheme),
                  theme: YaruTheme.of(context).theme ?? yaruLight,
                  previewBuilder: previewBuilder,
                ),
                YaruClip.diagonal(
                  position: YaruDiagonalClip.bottomLeft,
                  child: ThemeCard(
                    title: Text(l10n.systemTheme),
                    theme: YaruTheme.of(context).darkTheme ?? yaruDark,
                    previewBuilder: previewBuilder,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: kYaruPagePadding),
        Expanded(
          child: YaruBanner(
            padding: EdgeInsets.zero,
            selected: theme == ThemeMode.light,
            onTap: () => onChanged(ThemeMode.light),
            child: ThemeCard(
              theme: YaruTheme.of(context).theme ?? yaruLight,
              title: Text(l10n.lightTheme),
              previewBuilder: previewBuilder,
            ),
          ),
        ),
        const SizedBox(width: kYaruPagePadding),
        Expanded(
          child: YaruBanner(
            padding: EdgeInsets.zero,
            selected: theme == ThemeMode.dark,
            onTap: () => onChanged(ThemeMode.dark),
            child: ThemeCard(
              theme: YaruTheme.of(context).darkTheme ?? yaruDark,
              title: Text(l10n.darkTheme),
              previewBuilder: previewBuilder,
            ),
          ),
        ),
      ],
    );
  }
}

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    super.key,
    this.title,
    this.previewBuilder,
    required this.theme,
    this.scale = 0.3,
  });

  final Widget? title;
  final WidgetBuilder? previewBuilder;
  final ThemeData theme;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: IgnorePointer(
        child: YaruBorderContainer(
          clipBehavior: Clip.antiAlias,
          borderRadius:
              BorderRadius.circular(10).inner(const EdgeInsets.all(4)),
          child: LayoutBuilder(builder: (context, constraints) {
            return FittedBox(
              child: SizedBox(
                width: constraints.maxWidth / scale,
                height: constraints.maxHeight / scale,
                child: Stack(
                  children: [
                    Builder(builder: previewBuilder ?? (_) => const Scaffold()),
                    if (title != null)
                      DefaultTextStyle(
                        style: Theme.of(context).textTheme.displayLarge!,
                        child: Center(child: title!),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class VariantSelector extends StatelessWidget {
  const VariantSelector({super.key, this.variant, required this.onChanged});

  final YaruVariant? variant;
  final ValueChanged<YaruVariant> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final value in YaruVariant.values.take(10))
          YaruColorDisk(
            color: value.color,
            selected: variant == value,
            onPressed: () => onChanged(value),
          )
      ],
    );
  }
}
