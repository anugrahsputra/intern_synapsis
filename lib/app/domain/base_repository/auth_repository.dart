import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../domain.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, void>> logout();
}
