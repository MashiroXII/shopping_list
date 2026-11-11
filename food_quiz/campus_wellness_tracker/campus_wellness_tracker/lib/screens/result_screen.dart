import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultsScreen extends StatelessWidget {
  final int finalScore;

  const ResultsScreen({super.key, required this.finalScore});

  String get _classification {
    if (finalScore >= 17) {
      return 'Excellent Wellness Habits';
    } else if (finalScore >= 12) {
      return 'Moderate Wellness Habits';
    } else {
      return 'Needs Improvement';
    }
  }

  String get _recommendation {
    if (finalScore >= 17) {
      return 'Keep maintaining your current positive habits and balanced routine!';
    } else if (finalScore >= 12) {
      return 'You are doing okay, but consider improving your sleep schedule and water intake.';
    } else {
      return 'Your habits indicate high stress or low self-care. Try allocating more time for rest, hydration, and breaks.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Summary'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Icon(Icons.assessment, size: 64, color: Color(0xFF00796B)),
                      const SizedBox(height: 16),
                      Text(
                        'Your Wellness Score: $finalScore / 20',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Divider(height: 32),
                      const Text(
                        'Classification:',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _classification,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00796B),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Recommendation:',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _recommendation,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.restart_alt),
                label: const Text('Restart Assessment', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}