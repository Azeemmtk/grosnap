import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grosnap/core/error/exception.dart';
import 'package:grosnap/features/notification/data/datasource/notification_api_services.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late NotificationApiService apiService;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    apiService = NotificationApiService(dio: dio);
  });

  const testUrl = 'http://testurl';

  group('Notifications', () {
    final validResponse = {
      'data': [
        {
          'image': 'example.png',
          'title': 'Title',
          'body': 'Body 1 1 1',
          'timestamp': '2025-10-14T12:00:00Z',
        },
      ],
    };

    test('return list fo notification model on 200 response', () async {
      dioAdapter.onGet(testUrl, (server) => server.reply(200, validResponse));

      final data = await apiService.fetchNotifications(testUrl);
      expect(data.length, 1);
      expect(data[0].body, 'Body 1 1 1');
    });

    test('throw exception on non-200 ', () {
      dioAdapter.onGet(testUrl, (server) => server.reply(404, 'Not found'),);

      expect(() => apiService.fetchNotifications(testUrl), throwsA(isA<ServerException>()));
    },);

    test('throw exception on invalid formate', () {
      dioAdapter.onGet(testUrl, (server) => server.reply(200, {'datas': 'dataaaaa'}),);

      expect(()=> apiService.fetchNotifications(testUrl), throwsA(isA<ServerException>()));
      
    },);

  });
}
