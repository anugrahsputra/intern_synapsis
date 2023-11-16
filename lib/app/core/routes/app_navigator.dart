import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../core.dart';

class AppNavigator {
  final Logger log = Logger("Navigator");

  bool canPop(BuildContext context) => Navigator.of(context).canPop();

  bool isCurrentPage(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent == true;

  bool canNavigate(BuildContext context) {
    if (context.mounted) {
      return true;
    } else {
      log.warning("Cannot navigate because the context is unmounted");
      return false;
    }
  }

  void back<T>(BuildContext context, {T? result}) {
    if (canPop(context)) {
      Navigator.of(context).pop(result);
    }
  }

  void goToLogin(BuildContext context) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppPage.login,
      (route) => false,
    );
  }

  void goToSplash(BuildContext context) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppPage.splash,
      (route) => false,
    );
  }

  void goToSurvey(BuildContext context) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppPage.survey,
      (route) => false,
    );
  }

  void goToSurveyQuestion(BuildContext context, {required String surveyId}) {
    if (!canNavigate(context)) return;

    Navigator.of(context).pushNamed(AppPage.surveyQuestion, arguments: {
      "surveyId": surveyId,
    });
  }
}
