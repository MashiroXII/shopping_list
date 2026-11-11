import 'package:flutter/material.dart';
import '../../data/wellness_data.dart';
import '/widgets/answer_button.dart';
import 'result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int _currentIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _currentIndex++;
    });

    if (_currentIndex >= wellnessQuestions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(finalScore: _totalScore),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = wellnessQuestions[_currentIndex];
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentIndex + 1} of ${wellnessQuestions.length}'),
        // Adaptive progress indicator component
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            value: (_currentIndex + 1) / wellnessQuestions.length,
            backgroundColor: Colors.teal[100],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.amberAccent),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Option 1: Orientation & Responsive Layout Adaptation
          if (orientation == Orientation.landscape) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    child: Text(
                      question.questionText,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: question.options.map((option) {
                      return AnswerButton(
                        text: option.text,
                        onPressed: () => _answerQuestion(option.score),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }

          // Portrait Layout
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      question.questionText,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ...question.options.map((option) {
                  return AnswerButton(
                    text: option.text,
                    onPressed: () => _answerQuestion(option.score),
                  );
                }),
                const SizedBox(height: 20),
                // Option 3: Adaptive Component Example
                const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}