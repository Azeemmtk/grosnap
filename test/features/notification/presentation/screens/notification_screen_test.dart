import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grosnap/core/di/injection.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/notification/data/models/notification_model.dart';
import 'package:grosnap/features/notification/domain/entity/Notification.dart';
import 'package:grosnap/features/notification/presentation/provider/bloc/notification_bloc.dart';
import 'package:grosnap/features/notification/presentation/screens/notification_screen.dart';
import 'package:grosnap/features/notification/presentation/widgets/notification_card_widget.dart';

//mock bloc run flutter pub run build_runner build
class MockNotificationBloc
    extends MockBloc<NotificationEvent, NotificationState>
    implements NotificationBloc {}

void main() {
  late MockNotificationBloc mockBloc;

  setUp(() async{

    await getIt.reset();
    initializeDependencies();
    mockBloc = MockNotificationBloc();

    if(getIt.isRegistered<NotificationBloc>()){
      getIt.unregister<NotificationBloc>();
    }

    getIt.registerFactory<NotificationBloc>(() => mockBloc,);
  });

  testWidgets('notificationScreen loading state', (WidgetTester tester) async {
    whenListen(
      mockBloc,
      Stream.fromIterable([NotificationLoading()]),
      initialState: NotificationInitial(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<NotificationBloc>.value(
          value: mockBloc,
          child: NotificationScreen(),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('NotificationScreen loaded state', (WidgetTester tester) async {
    final data = [
      NotificationEntity(
        image: 'image5.png',
        title: 'Title5',
        body: 'Body5',
        timestamp: DateTime.now(),
      ),
    ];

    whenListen(
      mockBloc,
      Stream.fromIterable([NotificationLoaded(data)]),
      initialState: NotificationInitial(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(builder: (BuildContext context) {
          getSize(context);
          return BlocProvider<NotificationBloc>.value(
            value: mockBloc,
            child: NotificationScreen(),
          );
        },)
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(NotificationCardWidget), findsNWidgets(data.length));
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Title5'), findsOneWidget);


  });
}
