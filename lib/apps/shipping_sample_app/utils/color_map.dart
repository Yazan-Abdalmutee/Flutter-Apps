import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status) {
    case 'In Delivery':
      return Colors.deepOrange;
    case 'Pending':
      return Colors.blue;
    case 'Cancelled':
      return Colors.red;
    case 'Complete':
      return Color(0xFF409c51);
    default:
      return Colors.grey;
  }
}

Color getStatusContainerColor(String status) {
  switch (status) {
    case 'In Delivery':
      return Color(0xFFECD2B8);
    case 'Pending':
      return Color(0xFFB6CEE8);
    case 'Cancelled':
      return Color(0xFFE1AFAF);
    case 'Complete':
      return Color(0xffbfe8bf);
    default:
      return Colors.grey;
  }
}

Color getCardIconColor(bool isSelected) {
  if (isSelected == true) {
    return Colors.orange;
  } else {
    return Colors.grey;
  }
}

Color getCardTextColor(bool isSelected) {
  if (isSelected == true) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

Color getCardIconContainerColor(bool isSelected) {
  if (isSelected == true) {
    return Colors.white;
  } else {
    return Color(0xfff4f2f2);
  }
}

Color getBottomSectionColor(bool isSelected) {
  if (isSelected == true) {
    return Color(0xFF373733);
  } else {
    return Color(0xFFf6f6f6);
  }
}
