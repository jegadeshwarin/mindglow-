import 'dart:math';

import 'package:flutter/material.dart';

class MindGlow extends StatelessWidget {
  const MindGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // Background gradient
      Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight))),
      // Custom shape at the top
      Positioned(
          top: -50,
          left: -50,
          child: Transform.rotate(
              angle: -pi / 4,
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100))))),
      SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('MindGlow',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 8),
                    const Text('Your Personal Mental Health Companion',
                        style: TextStyle(fontSize: 24, color: Colors.white)),
                    const SizedBox(height: 32),
                    _buildFeatureCard(context,
                        icon: Icons.self_improvement,
                        title: 'Daily Mindfulness Challenges',
                        description:
                            'Receive a new mindfulness challenge each day, personalized to encourage positive mental habits. From meditation to gratitude journaling, each challenge helps you build a better you.'),
                    _buildFeatureCard(context,
                        icon: Icons.mood,
                        title: 'Mood Tracker',
                        description:
                            'Log your mood throughout the day with our simple, intuitive interface. Analyze your mood data to identify patterns, triggers, and improvements over time.'),
                    _buildFeatureCard(context,
                        icon: Icons.favorite,
                        title: 'Personalized Wellness Plan',
                        description:
                            'MindGlow creates a personalized wellness plan based on your initial assessment and ongoing interaction data. Your plan adapts over time to reflect your progress and changing needs.'),
                    _buildFeatureCard(context,
                        icon: Icons.school,
                        title: 'Educational Resources',
                        description:
                            'Explore a library of articles, videos, and podcasts on topics like managing stress, understanding emotions, and improving sleep quality. Content is curated from reputable sources and tailored to your interests.'),
                    _buildFeatureCard(context,
                        icon: Icons.group,
                        title: 'Community Support',
                        description:
                            'Join a safe, anonymous platform where you can share your experiences, challenges, and victories with a supportive community. Participate in moderated discussion groups on various mental health topics.')
                  ])))
    ]));
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Icon(icon, size: 40, color: Colors.purple),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(description,
                  style: const TextStyle(fontSize: 16, color: Colors.black87))
            ])));
  }
}
