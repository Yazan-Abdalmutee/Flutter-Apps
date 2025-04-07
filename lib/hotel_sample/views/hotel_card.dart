import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../models/card.dart';

class HotelCard extends StatelessWidget {
  final CardData cardData;
  final Color primaryColor = HexColor('#54D3C2');

  HotelCard({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage(cardData.imageAssetPath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              Positioned(
                top: 20,
                right: 20,
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: primaryColor,
                  size: 32,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardData.hotelName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${cardData.price}\$",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    // Left side items grouped in one Row
                    Row(
                      children: [
                        Text(cardData.location),
                        SizedBox(width: 4),
                        Icon(Icons.location_on, color: primaryColor),
                        SizedBox(width: 4),
                        Text("2 Km to City"),
                      ],
                    ),
                    SizedBox(width: 4),
                    Text("/per night"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star, size: 20, color: primaryColor),
                    Icon(Icons.star, size: 20, color: primaryColor),
                    Icon(Icons.star, size: 20, color: primaryColor),
                    Icon(Icons.star_border, size: 20, color: primaryColor),
                    Icon(Icons.star_border, size: 20, color: primaryColor),
                    SizedBox(height: 4, width: 4),
                    Text("8 reviews"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
