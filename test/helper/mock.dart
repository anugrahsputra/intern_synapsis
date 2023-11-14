import 'package:dio/dio.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/annotations.dart';

export 'mock.mocks.dart';

@GenerateNiceMocks([
  /*-------------> External <-------------*/
  MockSpec<Dio>(),

  /*-------------> Data <-------------*/
  /* Provider */
  MockSpec<AuthProvider>(),

  /*-------------> Domain <-------------*/
  /* Repository */
  MockSpec<AuthRepository>(),

  /* Usecase */
  MockSpec<LoginUsecase>(),
])
void main(List<String> args) {}
