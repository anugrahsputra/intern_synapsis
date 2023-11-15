import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/core.dart';
import 'presentation/presentation.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPref = await SharedPreferences.getInstance();
  sl.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: ApiPath.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    ),
  );

  sl.registerLazySingleton(() => sharedPref);

  /*-------------------> CORE <-------------------*/
  sl.registerSingleton<AppNavigator>(AppNavigator());

  /*------------------> DATA <------------------*/
  sl.registerLazySingleton<AuthProvider>(
      () => AuthProviderImpl(dio: sl<Dio>()));
  sl.registerLazySingleton<SurveyProvider>(
      () => SurveyProviderImpl(dio: sl<Dio>()));

  /*------------------> DOMAIN <------------------*/
  /* Repository */
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authProvider: sl<AuthProvider>()),
  );
  sl.registerLazySingleton<SurveyRepository>(
      () => SurveyRepositoryImpl(surveyProvider: sl<SurveyProvider>()));

  /* Usecase */
  sl.registerLazySingleton(
    () => LoginUsecase(authRepository: sl<AuthRepository>()),
  );
  sl.registerLazySingleton(
    () => GetAllSurveyUsecase(repository: sl<SurveyRepository>()),
  );
  sl.registerLazySingleton(
    () => GetSurveyUsecase(repository: sl<SurveyRepository>()),
  );

  /*------------------> CUBITS <------------------*/
  sl.registerFactory(() => AuthCubit(usecase: sl<LoginUsecase>()));
}
