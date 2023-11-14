part of 'login_page.dart';

class FormFIelds extends StatefulWidget {
  const FormFIelds({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.saveCredential,
    this.onChanged,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool saveCredential;
  final void Function(bool?)? onChanged;

  @override
  State<FormFIelds> createState() => _FormFIeldsState();
}

class _FormFIeldsState extends State<FormFIelds> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Email'),
          CustomTextFormField(
            controller: widget.emailController,
            hintText: "Email",
          ),
          const Gap(16),
          const Text('Password'),
          CustomTextFormField(
            controller: widget.passwordController,
            hintText: "Password",
            keyboardType: TextInputType.visiblePassword,
            obscureText: passwordVisible,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              icon: Icon(
                passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 20,
              ),
            ),
          ),
          const Gap(8),
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: widget.saveCredential,
                  onChanged: widget.onChanged,
                ),
              ),
              const Gap(8),
              const Text("Remember Me")
            ],
          )
        ],
      ),
    );
  }
}

class LoginButtons extends StatelessWidget {
  const LoginButtons(
      {super.key, required this.login, required this.fingerprint});

  final Function()? login;
  final Function()? fingerprint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            text: "Log In",
            textColor: Colors.white,
            color: const Color(0xff1FA0C9),
            onTap: login,
          ),
          const Gap(16),
          Text(
            "Or",
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xff1FA0C9),
            ),
          ),
          const Gap(16),
          CustomButton(
            text: "Fingerprint",
            textColor: const Color(0xff1FA0C9),
            onTap: fingerprint,
          ),
        ],
      ),
    );
  }
}
