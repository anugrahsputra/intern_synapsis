import 'package:equatable/equatable.dart';

class OptionEntity extends Equatable {
  final String? id;
  final String? questionId;
  final String? optionName;
  final int? value;
  final String? color;

  const OptionEntity({
    required this.id,
    required this.questionId,
    required this.optionName,
    required this.value,
    required this.color,
  });

  @override
  List<Object?> get props => [
        id,
        questionId,
        optionName,
        value,
        color,
      ];
}
