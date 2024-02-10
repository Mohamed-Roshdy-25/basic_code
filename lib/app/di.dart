import 'package:basic_code_for_any_project/presentation/bloc/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:basic_code_for_any_project/app/app_prefs.dart';
import 'package:basic_code_for_any_project/data/data_sources/local_data_source.dart';
import 'package:basic_code_for_any_project/data/data_sources/remote_data_source.dart';
import 'package:basic_code_for_any_project/data/network/network_info.dart';
import 'package:basic_code_for_any_project/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.allowReassignment = true;

  // shared prefs
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // internet connection checker
  instance.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  // app preferences
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance<SharedPreferences>()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl());

  instance.registerLazySingleton<AuthCubit>(() => AuthCubit());
}
