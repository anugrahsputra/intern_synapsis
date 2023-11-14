import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_synapsis/app/presentation/presentation.dart';

part 'login_page.component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool saveCred = false;

  @override
  Widget build(BuildContext context) {
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
              onChanged: (saveCred) {},
            ),
            LoginButtons(
              login: () {},
              fingerprint: () {},
            ),
          ],
        ));
  }
}
