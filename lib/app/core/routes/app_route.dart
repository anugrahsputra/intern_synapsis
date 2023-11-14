import 'package:flutter/material.dart';

import '../../presentation/presentation.dart';
import '../core.dart';

abstract class AppRoute {
  static String get initial => AppPage.login;

  static final Map<String, Widget Function(BuildContext context)> routes = {
    AppPage.login: (context) => LoginPage(),
    AppPage.survey: (context) => const SurveyPage(),
  };
}
