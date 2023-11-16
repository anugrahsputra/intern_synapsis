import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../injection.dart';
import '../../presentation.dart';

part 'login_page.component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AppNavigator navigator = sl<AppNavigator>();
  final LocalProvider local = sl<LocalProvider>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool saveCred = false;

  @override
  void initState() {
    super.initState();
    loadCred();
  }

  void loadCred() async {
    String? savedEmail = local.getEmail();
    String? savedPassword = local.getPassword();
    if (savedEmail != null && savedPassword != null) {
      emailController.text = savedEmail;
      passwordController.text = savedPassword;
      saveCred = true;
    }
  }

  void saveCredentials() async {
    if (saveCred) {
      local.setEmail(emailController.text);
      local.setPassword(passwordController.text);
    } else {
      local.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            CustomDialog.show(context);
          },
          success: () {
            navigator.goToSurvey(context);
          },
          error: (message) {
            log(message);
          },
        );
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Login to Synapsis",
                style: GoogleFonts.inter(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  height: 27,
                ),
              ),
              elevation: 0,
            ),
            body: Column(
              children: [
                FormFIelds(
                  emailController: emailController,
                  passwordController: passwordController,
                  saveCredential: saveCred,
                  onChanged: (value) {
                    setState(() {
                      saveCred = value ?? false;
                    });
                  },
                ),
                LoginButtons(
                  login: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      context.read<AuthCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      saveCredentials();
                    } else {
                      log('one of the field is still empty');
                    }
                  },
                  fingerprint: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
