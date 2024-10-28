import 'package:baca_app/blocs/auth/auth_bloc.dart';
import 'package:baca_app/models/sign_in_form_model.dart';
import 'package:baca_app/shared/shared_methods.dart';
import 'package:baca_app/shared/theme.dart';
import 'package:baca_app/ui/widgets/buttons.dart';
import 'package:baca_app/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                'Selamat Datang Kembali!',
                style: opensansGreyTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Masuk ke akun anda',
                style: robotoSoftGreyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              CustomFormField(
                title: 'Email',
                placeholderText: 'Email kamu',
                controller: emailController,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormField(
                title: 'Password',
                placeholderText: 'Kata sandi kamu',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Lupa Sandi?',
                style: robotoGreyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              CustomFilledButton(
                title: 'Login',
                onPressed: () {
                  if (validate()) {
                    context.read<AuthBloc>().add(
                          AuthLogin(
                            SignInFormModel(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                  } else {
                    showCustomSnackbar(context, 'Semua field harus diisi');
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextButton(
                title: 'Belum punya akun? Daftar yuk',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              )
            ],
          );
        },
      ),
    );
  }
}
