import 'package:flutter/material.dart';
import 'package:flutter_ui_samples/apps/shipping_sample_app/utils/color_map.dart';

import '../models/card_details.dart';

class PackageDetailsPage extends StatelessWidget {
  final PackageCardData cardData;

  const PackageDetailsPage({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailsPageBody(cardData: cardData));
  }
}

class DetailsPageBody extends StatelessWidget {
  final PackageCardData cardData;

  const DetailsPageBody({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xfff7f7f7),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfff7f7f7),
          body: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Package Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                createPackageDetailsCard(cardData),
                SizedBox(height: 20),
                createShippingStatusCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createPackageDetailsCard(PackageCardData cardData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 2.4),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: ColoredBox(
                    color: Color(0xfff4f2f2),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        size: 18,
                        Icons.account_box_rounded,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ID Number",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ColoredBox(
                              color: getStatusContainerColor(cardData.status),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  cardData.status,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: getStatusColor(cardData.status),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        cardData.idNumber,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.0),
            Text(
              "Details Package",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Name",
                      style: TextStyle(fontSize: 12, color: Color(0xff474545)),
                    ),
                    Text(cardData.customerName, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text(
                      "From",
                      style: TextStyle(fontSize: 12, color: Color(0xff474545)),
                    ),
                    Text("13 Jul, 2024", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontSize: 12, color: Color(0xff474545)),
                    ),
                    Text(cardData.status, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text(
                      "To",
                      style: TextStyle(fontSize: 12, color: Color(0xff474545)),
                    ),
                    Text("23 Jul, 2024", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget createShippingStatusCard() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 2.4),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shipping Status",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Stepper(
                  stepIconBuilder:
                      (stepIndex, stepState) => Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                  currentStep: 3,
                  controlsBuilder: (context, details) => SizedBox.shrink(),
                  type: StepperType.vertical,
                  steps: [
                    createStepOfStepper(
                      "Moving From",
                      "June 10, 2018 | 03:45 PM",
                    ),
                    createStepOfStepper(
                      "In Transit",
                      "Jackline Tower, New York",
                    ),
                    createStepOfStepper("Out for delivery", "Tracking Number"),
                    createStepOfStepper("Delivery", "Not delivered yet"),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Live Tracking",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      "Delivery",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Step createStepOfStepper(String title, String subtitle) {
    return Step(
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: TextStyle(color: Color(0xff474545))),
      content: SizedBox.shrink(),
    );
  }
}
