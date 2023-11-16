import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern_synapsis/app/data/data.dart';

import '../../../core/core.dart';
import '../../../injection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppNavigator navigate = sl<AppNavigator>();
  final LocalProvider check = sl<LocalProvider>();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    final isLoggedIn = check.getToken();
    if (isLoggedIn != null) {
      Timer(const Duration(seconds: 5), () {
        navigate.goToSurvey(context);
      });
    } else {
      Timer(const Duration(seconds: 5), () {
        navigate.goToLogin(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
