import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WrapHomePage(),
    );
  }
}

class WrapHomePage extends StatelessWidget {
  const WrapHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Sample'), centerTitle: true),
      body: Wrap(
        children: [
          Chip(
            label: Text("Chip 1"),
            avatar: CircleAvatar(backgroundColor: Colors.red),
          ),
          Chip(
            label: Text("Chip 1"),
            avatar: CircleAvatar(backgroundColor: Colors.blue),
          ),
          Chip(
            label: Text("Chip 1"),
            avatar: CircleAvatar(backgroundColor: Colors.yellow),
          ),
          Chip(
            label: Text("Chip 1"),
            avatar: CircleAvatar(backgroundColor: Colors.black),
          ),
          Chip(
            label: Text("Chip 1"),
            avatar: CircleAvatar(backgroundColor: Colors.purple),
          ),
        ],
      ),
    );
  }
}
