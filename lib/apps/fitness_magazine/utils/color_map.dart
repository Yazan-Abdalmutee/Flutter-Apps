import 'dart:ui';

Color getCategoryColor(String category) {
  Map<String, Color> colorMap = {
    'تغذية': Color(0xFfB4cf66),
    'صحة': Color(0xFF79bde8),
    'جمال': Color(0xFFf05e8e),
    'لياقة': Color(0xFFfccd0a),
  };
  return colorMap[category]!;
}
