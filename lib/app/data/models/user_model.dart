import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

class UserModel extends Equatable {
  final int occupationLevel;
  final String occupationName;

  const UserModel(
      {required this.occupationLevel, required this.occupationName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      occupationLevel: json['occupation_level'],
      occupationName: json["occupation_name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "occupation_level": occupationLevel,
      "occupation_name": occupationName,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      occupationLevel: occupationLevel,
      occupationName: occupationName,
    );
  }

  @override
  List<Object?> get props => [occupationLevel, occupationName];
}
