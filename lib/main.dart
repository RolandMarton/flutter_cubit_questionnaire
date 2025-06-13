import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nix_interview/repository/questions_repository.dart';
import 'package:nix_interview/screens/home_screen.dart';

void main() {
  runApp(RepositoryProvider<QuestionsRepository>(create: (_) => LocalQuestionsRepository(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}
