import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:intern_synapsis/app/core/core.dart';

import '../../domain/domain.dart';
import '../data.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthProvider authProvider;

  AuthRepositoryImpl({required this.authProvider});

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final result = await authProvider.login(email, password);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Something went wrong'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    }
  }
}
