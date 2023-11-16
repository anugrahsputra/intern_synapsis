import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<Either<Failure, void>> call() {
    return authRepository.logout();
  }
}
