import 'package:dio/dio.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'mock.mocks.dart';

@GenerateNiceMocks([
  /*-------------> External <-------------*/
  MockSpec<Dio>(),
  MockSpec<SharedPreferences>(),

  /*-------------> Data <-------------*/
  /* Provider */
  MockSpec<AuthProvider>(),
  MockSpec<SurveyProvider>(),
  MockSpec<LocalProvider>(),

  /*-------------> Domain <-------------*/
  /* Repository */
  MockSpec<AuthRepository>(),
  MockSpec<SurveyRepository>(),

  /* Usecase */
  MockSpec<LoginUsecase>(),
  MockSpec<GetAllSurveyUsecase>(),
  MockSpec<GetSurveyUsecase>(),
])
void main(List<String> args) {}
