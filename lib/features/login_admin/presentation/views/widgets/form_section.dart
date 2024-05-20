

import 'package:dashboard/core/widgets/custom_error.dart';
import 'package:dashboard/core/widgets/custom_progress_indicator.dart';
import 'package:dashboard/core/widgets/custom_text_button.dart';
import 'package:dashboard/features/login_admin/presentation/manger/login_admin_cubit/login_admin_cubit.dart';
import 'package:dashboard/features/login_admin/presentation/views/widgets/login_text_field.dart';
import 'package:dashboard/features/login_admin/presentation/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FormSection extends StatefulWidget {
  const FormSection({
    super.key,
  });

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool emailValidate() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var adminLoginCubt = BlocProvider.of<LoginAdminCubit>(context);
    void loginAdmin() async {
      await adminLoginCubt.loginAdmin(
          email: emailController.text, password: passwordController.text,context: context);
    }

    return BlocBuilder<LoginAdminCubit, LoginAdminState>(
      builder: (context, state) {
        if (state is LoginAdminLoading) {
          return const CustomProgressIndicator();
        } else if (state is LoginAdminFailure) {
          return CustomError(message: state.errorMessage);
        } else {
          return Form(
            key: keyForm,
            child: Column(
              children: [
                const TextWidget(
                  text: 'Email',
                ),
                Center(
                  child: SizedBox(
                    width: width * 0.3,
                    height: height * 0.1,
                    child: LoginTextField(
                      controller: emailController,
                      obscureText: false,
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
                const TextWidget(
                  text: 'password',
                ),
                SizedBox(
                  width: width * 0.3,
                  // height: screenHeight * 0.5,
                  child: LoginTextField(
                    hintText: 'Enter Your password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: width * 0.3,
                  height: height * 0.08,
                  child: CustomTextButton(
                    backGroundColor: Colors.blue,
                    label: 'Sign in',
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {
                        if (emailValidate()) {
                          loginAdmin();
                         
                          
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
