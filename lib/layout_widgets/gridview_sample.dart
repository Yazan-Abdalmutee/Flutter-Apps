import 'dart:math';

import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewSample(),
    );
  }
}

class GridViewSample extends StatelessWidget {
  const GridViewSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Sample'), centerTitle: true),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: List.generate(6, (index) {
          return ColoredBox(
            color: Color.fromRGBO(
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255),
              1,
            ),
          );
        }),
      ),
    );
  }
}
