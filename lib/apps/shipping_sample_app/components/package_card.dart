import 'package:flutter/material.dart';

import '../models/card_details.dart';
import '../pages/package_details_page.dart';
import '../utils/color_map.dart';

class PackageCard extends StatefulWidget {
  final PackageCardData cardData;

  const PackageCard({super.key, required this.cardData});

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color textColor = getCardTextColor(isSelected);

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.all(1),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 2.4),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            createCardUpperSection(textColor, isSelected),
            createCardBottomSection(textColor, isSelected, widget.cardData),
          ],
        ),
      ),
    );
  }

  Widget createCardUpperSection(Color textColor, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image:
            isSelected
                ? DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1550684376-efcbd6e3f031?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmxhY2slMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww',
                  ),
                )
                : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ColoredBox(
                    color: getCardIconContainerColor(isSelected),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        size: 18,
                        Icons.account_box_rounded,
                        color: getCardIconColor(isSelected),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ID Number",
                            style: TextStyle(fontSize: 10, color: textColor),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ColoredBox(
                              color:
                                  isSelected
                                      ? Color(0xff2b2a2a)
                                      : getStatusContainerColor(
                                        widget.cardData.status,
                                      ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  widget.cardData.status,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: getStatusColor(
                                      widget.cardData.status,
                                    ),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.cardData.idNumber,
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tracking number",
                      style: TextStyle(fontSize: 10, color: textColor),
                    ),
                    Text(
                      widget.cardData.trackingNumber,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Data Shipped",
                      style: TextStyle(fontSize: 10, color: textColor),
                    ),
                    Text(
                      widget.cardData.dataShipped,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(fontSize: 10, color: textColor),
                    ),
                    Text(
                      widget.cardData.location,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget createCardBottomSection(
    Color textColor,
    bool isSelected,
    PackageCardData cardData,
  ) {
    Color bottomColor = getBottomSectionColor(isSelected);
    return Container(
      decoration: BoxDecoration(
        color: bottomColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Colors.orange),
                ),
                Text(
                  "Track",
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                ),
              ],
            ),
            VerticalDivider(thickness: 1, color: Color(0xff9e9898)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PackageDetailsPage(cardData: cardData),
                  ),
                );
              },
              child: Text(
                "View Details",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
