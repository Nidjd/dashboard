import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/login_admin/data/repos/login_page_admin_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton(
    LoginPageAdminRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
