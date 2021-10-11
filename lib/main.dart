import 'package:flutter/material.dart';
import 'package:tekus_test/src/app.dart';
import 'package:tekus_test/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const App());
}
