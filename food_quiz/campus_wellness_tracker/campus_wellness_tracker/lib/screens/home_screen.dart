import 'package:flutter/material.dart';
import 'assessment_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Wellness Tracker'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isLargeScreen ? screenWidth * 0.2 : 24.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Evaluate your current study-life balance.',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Take a quick 5-question assessment to understand your daily wellness habits and receive personalized recommendations.',
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      const Divider(height: 32),
                      const Text(
                        'Student Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00796B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text('John Doe', style: TextStyle(fontSize: 16)),
                      const Text('BSCS-3', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssessmentScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text(
                  'Start Assessment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}