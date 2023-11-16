import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;

  AuthCubit({
    required this.loginUsecase,
    required this.logoutUsecase,
  }) : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final result = await loginUsecase.call(email, password);
    result.fold((fail) {
      emit(AuthState.error(fail.message));
    }, (r) {
      emit(const AuthState.success());
    });
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    final result = await logoutUsecase.call();
    result.fold((fail) {
      emit(AuthState.error(fail.message));
    }, (r) {
      emit(const AuthState.initial());
    });
  }
}
