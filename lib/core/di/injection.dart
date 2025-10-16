import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/bottom_nav/presentation/provider/cubit/bottom_nav_cubit.dart';
import '../../features/notification/data/datasource/notification_api_services.dart';
import '../../features/notification/data/datasource/notification_remote_data_source.dart';
import '../../features/notification/data/repository/notification_repository_impl.dart';
import '../../features/notification/domain/repository/notification_repository.dart';
import '../../features/notification/domain/usecases/get_notifications.dart';
import '../../features/notification/presentation/provider/bloc/notification_bloc.dart';
import '../network/network_info.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // External Dependencies
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NotificationApiService>(() => NotificationApiService(dio: getIt<Dio>()));

  // Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt<Connectivity>()));

  // Data Sources
  getIt.registerLazySingleton<NotificationRemoteDataSource>(
        () => NotificationRemoteDataSourceImpl(apiService: getIt<NotificationApiService>()),
  );

  // Repositories
  getIt.registerLazySingleton<NotificationRepository>(
        () => NotificationRepositoryImpl(
      remoteDataSource: getIt<NotificationRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetNotifications(repository: getIt<NotificationRepository>()));

  // BLoCs
  getIt.registerFactory(() => NotificationBloc(getNotifications: getIt<GetNotifications>()));

  // Cubits
  getIt.registerFactory(() => BottomNavCubit());
}