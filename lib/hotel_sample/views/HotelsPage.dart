import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'hotelCard.dart';
import '../models/card.dart';

final Color primaryColor = HexColor('#54D3C2');
final Color secondaryColor = HexColor('#54D3C2');
final List<CardData> cards = [];
final ColorScheme colorScheme = const ColorScheme.light().copyWith(
  primary: primaryColor,
  secondary: secondaryColor,
);


class HotelsPage extends StatelessWidget {
  HotelsPage({super.key}){
    addDummyData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: colorScheme,fontFamily: 'Roboto',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Roboto'),
          ),
          centerTitle: true,
          backgroundColor: primaryColor,
          actions: [
            Row(
              children: [
                Icon(Icons.favorite_border_outlined),
                SizedBox(width: 10.0, height: 10.0),
                Icon(Icons.location_on),
                SizedBox(width: 10.0, height: 10.0),
              ],
            ),
          ],
        ),

        body: Container(
          child: Column(
            children: [
              Container(
                color: const Color(0xFFF3EBEB),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "London",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ), // circular corners
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10, height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Choose date"),
                              Text(
                                "12 Dec - 22 Dec",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,

                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("Number of rooms"),
                              Text(
                                "1 Room - 2 Adults",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("530 Hotels Found"),
                            Row(
                              children: [
                                Text("Filters"),
                                SizedBox(height: 10, width: 10),
                                Icon(
                                  Icons.filter_list_sharp,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 10, height: 10),
                        Flexible(
                            child: ListView.separated(
                              itemCount: cards.length,
                              itemBuilder: (context, index) {
                                return HotelCard(cardData: cards[index]);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 10);
                              },
                            )
                        ),
                      ],
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

void addDummyData() {
  cards.add(
    CardData(
      hotelName: 'Grand Royal Hotel',
      price: 180,
      location: 'Wembley, London',
      imageAssetPath:'assets/images/hotel_1.png',
    ),
  );
  cards.add(
    CardData(
      hotelName: 'The Battle House Hotel',
      price: 200,
      location: 'Paris, France',
      imageAssetPath: 'assets/images/hotel_2.png',
    ),
  );

  cards.add(
    CardData(
      hotelName: 'Russel Erskine Hotel',
      price: 170,
      location: 'Madrid, Spain',
      imageAssetPath: 'assets/images/hotel_3.png',
    ),
  );

  cards.add(
    CardData(
      hotelName: 'Thomas Jefferson Hotel',
      price: 120,
      location: 'Berlin, Germany',
      imageAssetPath: 'assets/images/hotel_4.png',
    ),
  );
}
