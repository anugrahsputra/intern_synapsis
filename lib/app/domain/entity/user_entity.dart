import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? occupationLevel;
  final String? occupationName;

  const UserEntity({
    required this.occupationLevel,
    required this.occupationName,
  });

  @override
  List<Object?> get props => [occupationLevel, occupationName];
}
