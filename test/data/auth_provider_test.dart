import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/core/core.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:mockito/mockito.dart';

import '../helper/mock.dart';

void main() {
  late MockDio mockDio;
  late AuthProvider authProvider;

  setUp(() {
    mockDio = MockDio();
    authProvider = AuthProviderImpl(dio: mockDio);
  });

  const tEmail = "email@email.com";
  const tPassword = "password";

  test(
    "should login using email and password",
    () async {
      Response response = Response(
          requestOptions: RequestOptions(path: ""),
          statusCode: 200,
          data: {
            "data": {
              "occupation_level": 1,
              "occupation_name": "occupation_name"
            }
          });

      when(mockDio.post(
        ApiPath.login,
        options: anyNamed("options"),
        data: anyNamed("data"),
      )).thenAnswer((_) => Future.value(response));

      await authProvider.login(tEmail, tPassword);

      verify(
        mockDio.post(
          ApiPath.login,
          options: anyNamed("options"),
          data: {
            "email": tEmail,
            "password": tPassword,
          },
        ),
      );
    },
  );
}
