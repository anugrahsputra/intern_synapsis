import 'package:flutter/material.dart';
import 'package:intern_synapsis/app/app.dart';
import 'package:intern_synapsis/app/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
