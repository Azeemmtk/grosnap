import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // For compute
import '../../../../core/error/exception.dart';
import '../models/notification_model.dart';

// Data structure to pass to the isolate
class NotificationFetchParams {
  final String url;
  final Dio dio;

  NotificationFetchParams(this.url, this.dio);
}

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final Dio dio;

  NotificationRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    const String baseUrl = 'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json';
    try {
      // Offload the network request and parsing to an isolate
      return await compute(_fetchNotifications, NotificationFetchParams(baseUrl, dio));
    } catch (e) {
      throw ServerException('Server error: $e');
    }
  }
}

// Function to run in the isolate
Future<List<NotificationModel>> _fetchNotifications(NotificationFetchParams params) async {
  try {
    print('Fetching notifications in isolate');
    final response = await params.dio.get(params.url);
    print('Response received in isolate');

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
    throw ServerException('Server error in isolate: $e');
  }
}