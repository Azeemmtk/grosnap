import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/error/exception.dart';
import '../models/notification_model.dart';

class NotificationApiService {
  final Dio dio;

  NotificationApiService({required this.dio});

  Future<List<NotificationModel>> fetchNotifications(String url) async {
    try {
      print('Fetching notifications via API service');
      final response = await dio.get(url);
      print('Response received in API service');

      if (response.statusCode == 200) {
        final dynamic responseData = response.data is String ? jsonDecode(response.data) : response.data;

        if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
          final List<dynamic> data = responseData['data'];
          print('Data parsed: $data');

          // Validate that each item in data is a Map
          for (var item in data) {
            if (item is! Map<String, dynamic>) {
              throw ServerException('Invalid data format: expected Map<String, dynamic>, got ${item.runtimeType}');
            }
          }

          // Map the data to NotificationModel
          return data.map((json) => NotificationModel.fromJson(json as Map<String, dynamic>)).toList();
        } else {
          throw ServerException('Invalid response format');
        }
      } else {
        throw ServerException('Failed to load notifications: status code ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException('Server error in API service: $e');
    }
  }
}