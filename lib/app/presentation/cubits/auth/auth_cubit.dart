import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase usecase;

  AuthCubit({required this.usecase}) : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());
    final result = await usecase.call(email, password);
    result.fold((fail) {
      emit(AuthState.error(fail.message));
    }, (r) {
      emit(const AuthState.success());
    });
  }
}
