import 'package:flutter/material.dart';

import '../../presentation/presentation.dart';
import '../core.dart';

abstract class AppRoute {
  static String get initial => AppPage.login;

  static final Map<String, Widget Function(BuildContext context)> routes = {
    AppPage.login: (context) => const LoginPage(),
    AppPage.survey: (context) => const SurveyPage(),
    AppPage.surveyQuestion: (context) {
      Map<String, dynamic> arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      String surveyId = arguments["surveyId"];

      return SurveyQuestionPage(surveyId: surveyId);
    }
  };
}
