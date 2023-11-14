import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/core/core.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock.dart';

void main() {
  late MockAuthProvider mockAuthProvider;
  late AuthRepository authRepository;

  setUp(() {
    mockAuthProvider = MockAuthProvider();
    authRepository = AuthRepositoryImpl(authProvider: mockAuthProvider);
  });

  const tEmail = "email@email.com";
  const tPassword = "password";
  const tUserModel =
      UserModel(occupationLevel: 1, occupationName: "occupationName");

  group("Auth Repository", () {
    test("should return UserEntity when the login is successful", () async {
      when(mockAuthProvider.login(any, any))
          .thenAnswer((_) async => tUserModel);

      final result = await authRepository.login(tEmail, tPassword);

      expect(result, equals(Right(tUserModel.toEntity())));
      verify(mockAuthProvider.login(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthProvider);
    });

    test("should return ServerFailure when the login throws a ServerException",
        () async {
      when(mockAuthProvider.login(any, any)).thenThrow(ServerException());

      final result = await authRepository.login(tEmail, tPassword);

      expect(result, equals(const Left(ServerFailure('Something went wrong'))));
      verify(mockAuthProvider.login(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthProvider);
    });

    test(
        "should return ConnectionFailure when the login throws a SocketException",
        () async {
      when(mockAuthProvider.login(any, any))
          .thenThrow(const SocketException(''));

      final result = await authRepository.login(tEmail, tPassword);

      expect(
          result, equals(const Left(ConnectionFailure('Connection Failure'))));
      verify(mockAuthProvider.login(tEmail, tPassword));
      verifyNoMoreInteractions(mockAuthProvider);
    });
  });
}
