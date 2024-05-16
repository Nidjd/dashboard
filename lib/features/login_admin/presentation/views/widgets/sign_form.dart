import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/core/widgets/login_text_field.dart';
import 'package:dashboard/features/login_admin/presentation/manger/login_cubit/login_cubit.dart';
import 'package:dashboard/features/login_admin/presentation/views/login_page.dart';
import 'package:dashboard/features/login_admin/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class sign_form extends StatelessWidget {
  sign_form({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.2,
          ),
          Text(
            "Welcome to MainTainX! Lets make you",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.03),
          ),
          Text(
            "and your team more efficient.",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.03),
          ),
          SizedBox(height: screenHeight * 0.05),
          TextWidget(
            screenWidth: screenWidth,
            text: 'Email',
          ),
          Center(
            child: Container(
              width: screenWidth * 0.3,
              height: screenHeight * 0.1,
              child: LoginTextField(
                controller: emailController,
                obscureText: false,
                hintText: 'Enter your email',
              ),
            ),
          ),
          TextWidget(
            screenWidth: screenWidth,
            text: 'password',
          ),
          Container(
            width: screenWidth * 0.3,
            // height: screenHeight * 0.5,
            child: LoginTextField(
              controller: passwordController,
              obscureText: true,
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Container(
            width: screenWidth * 0.3,
            height: screenHeight * 0.08,
            child: CustomTextButton(
              backGroundColor: Colors.blue,
              label: 'Sign in',
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<LoginCubit>(context)
                      .signInWithEmailAndPassword("", "");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
