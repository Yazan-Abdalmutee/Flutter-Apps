import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_samples/fitness_magazine/views/selected_card.dart';

import '../models/main_card.dart';

class MainCard extends StatelessWidget {
  final MainCardData mainCardData;

  const MainCard({super.key, required this.mainCardData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectedCard(mainCardData: mainCardData),
          ),
        );
      },
      child: SizedBox(

        width: 310,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: mainCardData.tag,
                  child: SizedBox(
                    height: 220,
                    child: CachedNetworkImage(
                      width: 310,
                      imageUrl: mainCardData.imageAssetPath,
                      fit:BoxFit.fill ,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              color: mainCardData.color,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                mainCardData.category,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Somar',
                ),
              ),
            ),
            SizedBox(height: 10),

            Text(
              mainCardData.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Somar',
              ),
            ),
            SizedBox(height: 5),

            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              mainCardData.description,
              style: TextStyle(fontSize: 22, fontFamily: 'Somar'),
            ),
          ],
        ),
      ),
    );
  }
}
