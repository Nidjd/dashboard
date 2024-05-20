
import 'package:dashboard/core/utils/service_locator.dart';
import 'package:dashboard/features/login_admin/data/repos/login_page_admin_repo_impl.dart';
import 'package:dashboard/features/login_admin/presentation/manger/login_admin_cubit/login_admin_cubit.dart';
import 'package:dashboard/features/login_admin/presentation/views/widgets/form_section.dart';

import 'package:dashboard/features/login_admin/presentation/views/widgets/text_section.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    super.key,
  });

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const TextSection(),
        BlocProvider(
          create: (context) => LoginAdminCubit(
            getIt.get<LoginPageAdminRepoImpl>(),
          ),
          child: const FormSection(),
        ),
      ],
    );
  }
}
