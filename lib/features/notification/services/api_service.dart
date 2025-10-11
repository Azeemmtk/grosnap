import 'package:grosnap/features/notification/data/models/notification_model.dart';
import 'package:dio/dio.dart';

class ApiService{

  final String _baseUrl= 'https://raw.githubusercontent.com/sayanp23/test-api/main/test-notifications.json';

  Future<List<NotificationModel>> fetchNotifications() async{
    try{
      final dio= Dio();
      
      final response= await dio.get(_baseUrl);
      if(response.statusCode== 200){
        final jsonData= response.data as Map<String, dynamic>;
        final List<dynamic> notificationJson= jsonData['data'] as List<dynamic>;
        return notificationJson.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notification: ${response.statusCode}');
      }
    } catch (e){
      throw Exception('failed to load notifications');
    }
  }

}