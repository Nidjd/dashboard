import 'package:dashboard/features/home_page/presentation/home_page.dart';
import 'package:dashboard/features/login_admin/presentation/views/widgets/sign_form.dart';
import 'package:dashboard/features/login_admin/presentation/manger/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
          showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        } else if (state is LoginSuccess) {
          //  الانتقال
          // Navigator.pushReplacementNamed(context, HomePage());
          isLoading = false;
        } else if (state is LoginFailure) {
          print("LoginFailure");
          isLoading = false;
          //snakbar
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: sign_form(screenWidth: screenWidth, screenHeight: screenHeight),
        );
      },
    );
  }
}
