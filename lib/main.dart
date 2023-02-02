import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';

import 'app.dart';
import 'services.dart';
import 'settings.dart';

void main() {
  registerService(Numbers.new);

  runApp(
    ChangeNotifierProvider(
      create: (_) => Settings(),
      child: const NumbersApp(),
    ),
  );
}
