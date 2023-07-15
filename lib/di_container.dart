import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:i2connect/data/datasource/remote/dio/dio_client.dart';
import 'package:i2connect/data/repository/auth_repo.dart';

import 'package:i2connect/helper/network_info.dart';
import 'package:i2connect/provider/auth_provider.dart';
import 'package:i2connect/provider/theme_provider.dart';
import 'package:i2connect/provider/splash_provider.dart';

import 'package:i2connect/util/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  //sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));

  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}