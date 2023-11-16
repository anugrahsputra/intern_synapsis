import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

class OptionModel extends Equatable {
  final String? id;
  final String? questionId;
  final String? optionName;
  final int? value;
  final String? color;

  const OptionModel({
    required this.id,
    required this.questionId,
    required this.optionName,
    required this.value,
    required this.color,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      questionId: json['question_id'],
      optionName: json['option_name'],
      value: json['value'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_id': questionId,
      'option_name': optionName,
      'value': value,
      'color': color,
    };
  }

  OptionEntity toEntity() {
    return OptionEntity(
      id: id,
      questionId: questionId,
      optionName: optionName,
      value: value,
      color: color,
    );
  }

  @override
  List<Object?> get props => [
        id,
        questionId,
        optionName,
        value,
        color,
      ];
}
