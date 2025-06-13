import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nix_interview/cubits/form_cubit.dart';
import 'package:nix_interview/cubits/form_state.dart';

class QuestionnaireForm extends StatefulWidget {
  const QuestionnaireForm({super.key});

  @override
  State<QuestionnaireForm> createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, QuestionnaireState>(
      builder: (context, state) {
        if (state.questions.isEmpty) {
          return const CircularProgressIndicator();
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Enter your name'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter a name' : null,
                ),
                const SizedBox(height: 16),
                ...List.generate(state.questions.length, (index) {
                  final question = state.questions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(question.question, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ...question.options.map(
                        (option) => RadioListTile<String>(
                          title: Text(option),
                          value: option,
                          groupValue: _selectedAnswers[index],
                          onChanged: (value) {
                            setState(() {
                              _selectedAnswers[index] = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _selectedAnswers.length == state.questions.length) {
                      final name = nameController.text;
                      final answers =
                          state.questions.asMap().entries.map((entry) {
                            final index = entry.key;
                            return _selectedAnswers[index]!;
                          }).toList();

                      context.read<FormCubit>().submitForm(name, answers);
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
                    }
                  },
                  child: const Text("Submit"),
                ),
                if (state.name != null && state.name!.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text("Thanks, ${state.name}!", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Your answers: ${state.answers?.join(', ')}"),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
