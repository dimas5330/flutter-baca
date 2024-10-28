import 'package:baca_app/blocs/auth/auth_bloc.dart';
import 'package:baca_app/ui/pages/home_page.dart';
import 'package:baca_app/ui/pages/onboarding_page.dart';
import 'package:baca_app/ui/pages/profile_edit_page.dart';
import 'package:baca_app/ui/pages/profile_edit_success_page.dart';
import 'package:baca_app/ui/pages/profile_page.dart';
import 'package:baca_app/ui/pages/sign_in_page.dart';
import 'package:baca_app/ui/pages/sign_up_page.dart';
import 'package:baca_app/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
        },
      ),
    );
  }
}
