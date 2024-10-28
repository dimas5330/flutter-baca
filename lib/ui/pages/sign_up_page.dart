import 'package:baca_app/blocs/auth/auth_bloc.dart';
import 'package:baca_app/models/sign_up_form_model.dart';
import 'package:baca_app/shared/shared_methods.dart';
import 'package:baca_app/shared/theme.dart';
import 'package:baca_app/ui/pages/sign_up_set_profile.dart';
import 'package:baca_app/ui/widgets/buttons.dart';
import 'package:baca_app/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpSetProfilePage(
                  data: SignUpFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
            );
          }
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.e,
                ),
                backgroundColor: redColor,
              ),
            );
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
                'Daftar',
                style: opensansGreyTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Bikin akun dulu yuk',
                style: robotoSoftGreyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomFormField(
                title: 'Nama',
                placeholderText: 'Nama Kamu',
                controller: nameController,
              ),
              CustomFormField(
                title: 'Email',
                placeholderText: 'Email Kamu',
                controller: emailController,
              ),
              CustomFormField(
                title: 'Kata Sandi',
                placeholderText: 'Kata Sandi Kamu',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomFilledButton(
                title: 'Daftar',
                onPressed: () {
                  if (validate()) {
                    context
                        .read<AuthBloc>()
                        .add(AuthCheckEmail(emailController.text));
                  } else {
                    showCustomSnackbar(context, 'Semua field harus diisi');
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextButton(
                title: 'Udah punya akun? Masuk yuk',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              )
            ],
          );
        },
      ),
    );
  }
}
