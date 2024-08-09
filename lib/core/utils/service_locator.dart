import 'package:dashboard/core/utils/api_service.dart';
import 'package:dashboard/features/add_electrical/data/repos/add_electronic_device_repo_impl.dart';
import 'package:dashboard/features/add_maintenance_worker/data/repos/add_maintenance_worker_repo_impl.dart';
import 'package:dashboard/features/login_admin/data/repos/login_page_admin_repo_impl.dart';
import 'package:dashboard/features/processes_orders/data/repos/show_scheduling_repo/show_scheduling_repo_impl.dart';
import 'package:dashboard/features/processes_orders/data/repos/update_request_by_admin_repo/update_request_by_admin_repo_impl.dart';
import 'package:dashboard/features/reporting/data/repos/generate_ratio_repo_impl.dart';
import 'package:dashboard/features/reporting/data/repos/generate_statistics_repo_impl.dart';
import 'package:dashboard/features/show_teams/data/repos/teams%20repos/show_teams_repo_impl.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/delete_worker_repo_impl.dart';
import 'package:dashboard/features/show_teams/data/repos/worker%20repos/show_workers_repo_impl.dart';
import 'package:dio/dio.dart';

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

  getIt.registerSingleton(
    AddMaintenanceWorkerRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(
    AddElectronicDeviceRepoImpl(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton(ShowTeamsRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton(ShowWorkersRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton(DeleteWorkerRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton(
    GenerateStatisticsRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton(GenerateRatioRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton(ShowSchedulingRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton(UpdateRequestByAdminRepoImpl(getIt.get<ApiService>()));
}
