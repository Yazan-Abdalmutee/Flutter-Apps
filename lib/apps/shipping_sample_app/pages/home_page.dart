import 'package:flutter/material.dart';
import 'package:flutter_ui_samples/apps/shipping_sample_app/components/package_card.dart';

import '../models/card_details.dart';

final List<PackageCardData> cards = [];

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    addDummyData();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xfff7f7f7),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfff7f7f7),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Record",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 0.01,
                                blurRadius: 0.01,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xfff4f2f2),
                          ),
                          child: Icon(Icons.more_horiz_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          createFilterChip("All", Colors.orange, Colors.white),
                          const SizedBox(width: 10),
                          createFilterChip(
                            "Complete",
                            Colors.white,
                            Colors.black,
                          ),
                          const SizedBox(width: 10),
                          createFilterChip(
                            "In Delivery",
                            Colors.white,
                            Colors.black,
                          ),
                          const SizedBox(width: 10),
                          createFilterChip(
                            "Pending",
                            Colors.white,
                            Colors.black,
                          ),
                          const SizedBox(width: 10),
                          createFilterChip(
                            "Cancelled",
                            Colors.white,
                            Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(child: createListView()),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(child: createFloatingButtons()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createListView() {
    return ListView.separated(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return PackageCard(cardData: cards[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
    );
  }

  Widget createFilterChip(String label, Color chipColor, Color textColor) {
    return FilterChip(
      backgroundColor: chipColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      label: Text(label, style: TextStyle(color: textColor)),
      onSelected: (value) => {},
    );
  }

  Widget createFloatingButtons() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xff191818),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.home_outlined),
                    SizedBox(width: 3),
                    Text("Home", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 7),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff2b2a2a),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add_card_outlined, color: Colors.white),
              ),
            ),
            SizedBox(width: 7),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff2b2a2a),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.local_taxi_outlined, color: Colors.white),
              ),
            ),
            SizedBox(width: 7),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff2b2a2a),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person_outlined, color: Colors.white),
              ),
            ),
            SizedBox(width: 7),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xff2b2a2a),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.wallet_travel_outlined, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void addDummyData() {
  List<PackageCardData> dummyCardData = [
    PackageCardData(
      idNumber: 'ID001JK21',
      trackingNumber: 'TRK123456',
      dataShipped: '2025-05-01',
      location: 'Hebron',
      status: 'Complete',
      customerName: 'Yazan Shrouf',
    ),
    PackageCardData(
      idNumber: 'ID002JK21',
      trackingNumber: 'TRK123457',
      dataShipped: '2025-04-28',
      location: 'Ramallah',
      status: 'In Delivery',
      customerName: 'Ahmad Ali',
    ),
    PackageCardData(
      idNumber: 'ID003JK21',
      trackingNumber: 'TRK123458',
      dataShipped: '2025-05-03',
      location: 'Nablus',
      status: 'Pending',
      customerName: 'Adel Sami',
    ),
    PackageCardData(
      idNumber: 'ID004JK21',
      trackingNumber: 'TRK123459',
      dataShipped: '2025-05-05',
      location: 'Jerusalem',
      status: 'Cancelled',
      customerName: 'Omar Fahd',
    ),
    PackageCardData(
      idNumber: 'ID111JK21',
      trackingNumber: 'TRK123456',
      dataShipped: '2025-02-01',
      location: 'Yafa',
      status: 'Complete',
      customerName: 'Ronaldo Messi',
    ),
  ];
  cards.addAll(dummyCardData);
}
