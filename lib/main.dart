import 'package:flutter/material.dart';
import 'package:flutter_ui_samples/xylophone/views/colors_page.dart';

import 'hotel_sample/views/hotels_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  HotelsPage();
  }
}
