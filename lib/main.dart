import 'package:flutter/material.dart';
import 'package:one_signal_test/interfaces/one_signal_notification_interface.dart';
import 'package:one_signal_test/modules/home/home_controller.dart';
import 'package:one_signal_test/modules/home/home_page.dart';
import 'package:one_signal_test/modules/home/home_store.dart';
import 'package:one_signal_test/services/one_signal_notification_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        // Provider<IOneSignalNotification>(
        //   create: (_) => OneSignalNotificationService(),
        // ),

        Provider<IOneSignalNotification>.value(
          value: OneSignalNotificationService(),
        ),

        ProxyProvider<IOneSignalNotification, HomeStore>(
            update: (BuildContext context,
                    IOneSignalNotification notificationService, _) =>
                HomeStore(iOneSignalNotification: notificationService)),
                
        ProxyProvider<HomeStore, HomeController>(
          update: (context, HomeStore homeStore, _) =>
              HomeController(homeStore),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
