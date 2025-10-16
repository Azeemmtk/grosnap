import 'package:dartz/dartz.dart';
import 'package:grosnap/core/usecases/usecase.dart';
import 'package:grosnap/features/notification/domain/repository/notification_repository.dart';
import '../../../../core/error/failure.dart';
import '../entity/Notification.dart';

class GetNotifications implements UseCase<List<NotificationEntity>, NoParams>{

  final NotificationRepository repository;

  GetNotifications({required this.repository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call( NoParams params) async{
    return await repository.getNotifications();
  }

}
