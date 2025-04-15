import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../models/main_card.dart';

class SelectedCard extends StatelessWidget {
  final MainCardData mainCardData;
  final List<Locale> appSupportedLocales = const [Locale('ar')];

  const SelectedCard({super.key, required this.mainCardData});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: appSupportedLocales,

      home: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(mainCardData.imageAssetPath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 13,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          mainCardData.title,
                          style: TextStyle(fontSize: 30, fontFamily: 'Somar'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            mainCardData.description,
                            style: TextStyle(fontSize: 18, fontFamily: 'Somar'),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
