import 'package:nix_interview/models/question_model.dart';

abstract class QuestionsRepository {
  List<QuestionModel> getQuestions();
}

class LocalQuestionsRepository implements QuestionsRepository {
  @override
  List<QuestionModel> getQuestions() {
    return [
      QuestionModel('First question', ['first', "second", "third"]),
      QuestionModel('Second question', ['first', "second", "third"]),
      QuestionModel('Third question', ['first', "second"]),
      QuestionModel('Fourth question', ['first']),
    ];
  }
}
