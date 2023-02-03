import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        Html(
          data: l10n.footerLabel('numberapi.com', 'http://numbersapi.com'),
          shrinkWrap: true,
          onAnchorTap: (url, _, __, ___) => launchUrlString(url!),
        ),
      ],
    );
  }
}
