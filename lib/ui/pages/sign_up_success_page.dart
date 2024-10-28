import 'package:baca_app/models/sign_up_form_model.dart';
import 'package:baca_app/shared/theme.dart';
import 'package:baca_app/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key, required SignUpFormModel data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img_register_success.png'),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Selamat!',
              style: opensansGreyTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Akun kamu sudah berhasil dibuat',
              style: robotoSoftGreyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 64,
            ),
            CustomFilledButton(
              title: 'Ke Beranda',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              width: 183,
            ),
          ],
        ),
      ),
    );
  }
}
