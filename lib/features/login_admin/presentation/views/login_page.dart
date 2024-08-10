import 'package:dashboard/features/login_admin/presentation/views/widgets/sign_form.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/x.png",
              ),
              opacity: 0.1,
            )),
            child: const SignForm()),
      ),
    );
  }
}
