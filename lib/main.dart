import 'package:flutter/material.dart';

import 'hotel_sample/views/HotelsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HotelsPage());
  }
}
