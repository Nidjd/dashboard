import 'package:bloc/bloc.dart';

import 'package:dashboard/core/errors/failures.dart';


import 'package:dashboard/core/utils/shared_preference_store.dart';
import 'package:dashboard/features/home_page/presentation/home_page.dart';
import 'package:dashboard/features/login_admin/data/models/admin_inforation_login/admin_inforation_login.dart';
import 'package:dashboard/features/login_admin/data/repos/login_page_admin_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';




part 'login_admin_state.dart';

class LoginAdminCubit extends Cubit<LoginAdminState> {
  final LoginPageAdminRepo _loginPageAdminRepo;
  LoginAdminCubit(this._loginPageAdminRepo) : super(LoginAdminInitial());

  

  Future<void> loginAdmin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginAdminLoading());
    var data =
        await _loginPageAdminRepo.loginAdmin(email: email, password: password);
    data.fold((Failure f) {
      emit(LoginAdminFailure(f.eerMessage));
    }, (AdminInforationLogin a) async {
      await setToSharedPreference(
          key: 'token', token: a.accessToken.toString());
      emit(LoginAdminSuccess(a));
      if(a.user!.id != null)
      {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),),);
      }
    });
  }
}
