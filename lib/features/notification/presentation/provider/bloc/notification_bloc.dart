import 'package:bloc/bloc.dart';
import 'package:grosnap/core/usecases/usecase.dart';
import 'package:grosnap/features/notification/domain/usecases/get_notifications.dart';
import 'package:meta/meta.dart';
import '../../../domain/entity/Notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  final GetNotifications getNotifications;

  NotificationBloc({required this.getNotifications}) : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async{
      emit(NotificationLoading());
      final result= await getNotifications(NoParams());
      result.fold(
        (failure) => emit(NotificationError(failure.message)),
        (notifications) => emit(NotificationLoaded(notifications)),
      );
    });
  }
}
