import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intern_synapsis/app/data/data.dart';
import 'package:intern_synapsis/app/domain/domain.dart';
import 'package:mockito/mockito.dart';

import '../../helper/mock.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUsecase loginUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUsecase = LoginUsecase(authRepository: mockAuthRepository);
  });

  const tEmail = "test@test.com";
  const tPassword = "Password";

  const tUser = UserModel(
    occupationLevel: 1,
    occupationName: "occupationName",
  );

  test("should return userModel toEntity()", () async {
    when(mockAuthRepository.login(any, any))
        .thenAnswer((_) async => Right(tUser.toEntity()));

    final result = await loginUsecase.call(tEmail, tPassword);

    expect(result, Right(tUser.toEntity()));
  });
}
