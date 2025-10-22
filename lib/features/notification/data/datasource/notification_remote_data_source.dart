import 'package:flutter/foundation.dart';
import '../../../../core/error/exception.dart';
import '../models/notification_model.dart';
import 'notification_api_services.dart';

class NotificationFetchParams {
  final String url;
  final NotificationApiService apiService;

  NotificationFetchParams(this.url, this.apiService);
}

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final NotificationApiService apiService;

  NotificationRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    const String baseUrl = 'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json';
    try {
      // isolate
      return await compute(_fetchNotifications, NotificationFetchParams(baseUrl, apiService));
    } catch (e) {
      throw ServerException('Server error: $e');
    }
  }
}

// isolate function
Future<List<NotificationModel>> _fetchNotifications(NotificationFetchParams params) async {
  return await params.apiService.fetchNotifications(params.url);
}