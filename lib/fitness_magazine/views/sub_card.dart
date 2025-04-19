import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_samples/fitness_magazine/views/selected_card.dart';

import '../models/main_card.dart';

class SubCard extends StatelessWidget {
  final MainCardData mainCardData;

  const SubCard({super.key, required this.mainCardData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectedCard(mainCardData: mainCardData,),
          ),
        );
      },
      child: Card(
        color: mainCardData.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: mainCardData.tag,
              child: SizedBox(
                width: 150,
                child: CachedNetworkImage(
                  height: 140,
                  imageUrl: mainCardData.imageAssetPath,
                  fit:BoxFit.fill ,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        mainCardData.description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Somar',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Icon(Icons.share, color: Colors.white),
                        SizedBox(width: 6,),
                        Icon(Icons.favorite_border_outlined, color: Colors.white),
                        SizedBox(width: 6,),
                        Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
