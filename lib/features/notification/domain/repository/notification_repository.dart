import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entity/Notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();
}