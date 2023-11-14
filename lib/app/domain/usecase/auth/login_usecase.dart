import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  Future<Either<Failure, UserEntity>> call(String email, String password) {
    return authRepository.login(email, password);
  }
}
