import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nix_interview/cubits/form_state.dart';
import 'package:nix_interview/repository/questions_repository.dart';

class FormCubit extends Cubit<QuestionnaireState> {
  final QuestionsRepository repository;

  FormCubit(this.repository) : super(QuestionnaireState());

  void retrieveQuestions() {
    final questions = repository.getQuestions();
    emit(state.copyWith(questions: questions));
  }

  void submitForm(String name, List<String> answers) {
    emit(state.copyWith(name: name, answers: answers));
  }
}
