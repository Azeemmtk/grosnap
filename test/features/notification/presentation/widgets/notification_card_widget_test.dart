import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/notification/presentation/widgets/notification_card_widget.dart';
import 'package:grosnap/features/notification/utils/formate_time.dart';

void main(){
  
  testWidgets('notificationCardWidget renders', (WidgetTester tester) async{
  final time= DateTime.now();
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (BuildContext context) {
        getSize(context);
        return NotificationCardWidget(
          image: 'image.png',
          title: 'Title1',
          body: 'Body1',
          time: time,
        );
      }),
    ));

    //checking widget present or not
    expect(find.text('Title1'), findsOneWidget);
    expect(find.text('Body1'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text(formatTime(time.toString())), findsOneWidget);

    //checking style
    final titleFinder= find.text('Title1');
    final titleWidget= tester.widget<Text>(titleFinder);
    expect(titleWidget.style?.fontWeight, FontWeight.bold);
    expect(titleWidget.style?.fontSize, 18);



  },);
  
  testWidgets('notificationCardWidget long text test', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: NotificationCardWidget(
        image: 'image.png',
        title: 'title notificationCardWidget long text test',
        body: 'title notificationCardWidget long text test',
        time: DateTime.now(),
    ),));
    
    
    expect(tester.takeException(), isNull);
  },);
}