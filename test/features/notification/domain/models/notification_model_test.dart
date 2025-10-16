import 'package:flutter_test/flutter_test.dart';
import 'package:grosnap/features/notification/data/models/notification_model.dart';

void main() {
  group('notificationModel', () {
    //sample json
    final json = {
      'image': 'image.jpg',
      'title': 'title 1',
      'body': 'body 1',
      'timestamp': '2025-10-14T12:00:00Z',
    };

    test('from json parsing', () {
      final model = NotificationModel.fromJson(json);

      expect(model.image, 'image.jpg');
      expect(model.title, 'title 1');
      expect(model.timestamp, DateTime.parse('2025-10-14T12:00:00Z'));
    });

    test('from json uses default value for missing field', () {
      final Map<String, dynamic> data = {};

      final model = NotificationModel.fromJson(data);

      expect(model.image, 'default.png');
      expect(model.title, 'No Title');
      expect(model.body, 'No Body');
    });
    
    test('convert model back to json', () {
      final model= NotificationModel(
          image: 'image3.png',
          title: 'Title 3',
          body: 'Body content',
          timestamp: DateTime.parse('2025-10-14T12:00:00Z'),
      );

      final json= model.toJson();

      expect(json['image'], 'image3.png');
      expect(json['title'], 'Title 3');
      expect(json['body'], 'Body content');
      expect(json['timestamp'], '2025-10-14T12:00:00.000Z');
    },);
  });
}
