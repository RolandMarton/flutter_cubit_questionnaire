import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nix_interview/cubits/form_cubit.dart';
import 'package:nix_interview/repository/questions_repository.dart';
import 'package:nix_interview/widgets/questionnaire_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(context.read<QuestionsRepository>())..retrieveQuestions(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
        body: QuestionnaireForm(),
      ),
    );
  }
}
