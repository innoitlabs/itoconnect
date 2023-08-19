import 'package:get_it/get_it.dart';
import 'package:i2connect/data/service/api_client.dart';
import 'package:i2connect/data/service/api_service.dart';
import 'package:i2connect/util/app_constants.dart';

final getIt = GetIt.instance;

void initSingletons() {
  getIt.registerLazySingleton(() => APIClient(baseUrl: AppConstants.baseUrl));
  getIt.registerLazySingleton(() => APIService());
}
