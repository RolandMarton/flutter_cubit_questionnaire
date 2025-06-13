import 'package:nix_interview/models/question_model.dart';

class QuestionnaireState {
  final String? name;
  final List<String>? answers;
  final List<QuestionModel> questions;

  QuestionnaireState({
    this.name = '',
    this.answers = const [],
    this.questions = const [],
  });

  QuestionnaireState copyWith({
    String? name,
    List<String>? answers,
    List<QuestionModel>? questions,
  }) {
    return QuestionnaireState(
      name: name ?? this.name,
      answers: answers ?? this.answers,
      questions: questions ?? this.questions,
    );
  }
}