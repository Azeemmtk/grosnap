class NotificationEntity {
  final String image;
  final String title;
  final String body;
  final DateTime timestamp;

  const NotificationEntity({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });
}