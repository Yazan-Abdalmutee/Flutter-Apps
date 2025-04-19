import 'package:flutter/material.dart';

import 'apps/fitness_magazine/views/magazine_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FitnessPage();
  }
}
