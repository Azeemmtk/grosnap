import '../../domain/entity/Notification.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.image,
    required super.title,
    required super.body,
    required super.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    try {
      return NotificationModel(
        image: json['image'] as String? ?? 'default.png',
        title: json['title'] as String? ?? 'No Title',
        body: json['body'] as String? ?? 'No Body',
        timestamp: DateTime.parse(json['timestamp'] as String? ?? DateTime.now().toIso8601String()),
      );
    } catch (e) {
      throw FormatException('Failed to parse JSON: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'body': body,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}