import 'package:dio/dio.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:mockito/annotations.dart';

export 'mock.mocks.dart';

@GenerateNiceMocks([
  /* External */
  MockSpec<Dio>(),

  /* Data */
  MockSpec<AuthProvider>(),
])
void main(List<String> args) {}
