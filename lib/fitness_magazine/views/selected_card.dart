import 'package:cached_network_image/cached_network_image.dart';
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
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: mainCardData.tag,
                    child: SizedBox(
                      height: 300,
                      child: CachedNetworkImage(
                        imageUrl: mainCardData.imageAssetPath,
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
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),
          
              Positioned(
                top: 260,
                bottom: 0,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            mainCardData.title,
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Somar',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              mainCardData.description,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Somar',
                              ),
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
      ),
    );
  }
}
