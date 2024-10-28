import 'package:baca_app/blocs/auth/auth_bloc.dart';
import 'package:baca_app/shared/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }

          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Image.asset(
                'assets/img_bintang.png',
                width: 105,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                width: 267,
                height: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img_logo.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
