import 'package:flutter/material.dart';

import '../models/sub_card.dart';

class SubCard extends StatelessWidget {
  final SubCardData subCardData;

  const SubCard({super.key, required this.subCardData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: subCardData.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(subCardData.imageAssetPath),
                fit: BoxFit.fill,
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
                      subCardData.description,
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
    );
  }
}
