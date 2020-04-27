import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/core/services/api_service/fake_api.dart';
import 'package:dashboard/core/services/api_service/graphql_api.dart';
import 'package:dashboard/core/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_API = true;

void setupLocator() {
  locator.registerLazySingleton<ApiService>(
      () => USE_FAKE_API ? FakeAPI() : GraphqlAPI());

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
