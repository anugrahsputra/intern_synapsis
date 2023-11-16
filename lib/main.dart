import 'package:flutter/material.dart';
import 'package:intern_synapsis/app/app.dart';
import 'package:intern_synapsis/app/injection.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  await init();
  runApp(const App());
}
