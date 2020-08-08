import 'package:flutter/material.dart';
import 'package:one_signal_test/modules/home/home_controller.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false)
        .store
        .iOneSignalNotification
        .initService();
    Provider.of<HomeController>(context, listen: false)
        .store
        .iOneSignalNotification
        .setNotificationType();
    Provider.of<HomeController>(context, listen: false)
        .store
        .iOneSignalNotification
        .receiverHandler();
    Provider.of<HomeController>(context, listen: false)
        .store
        .iOneSignalNotification
        .openingHandler();
    Provider.of<HomeController>(context, listen: false)
        .store
        .iOneSignalNotification
        .getOneSignalId()
        .then((value) {
      Provider.of<HomeStore>(context, listen: false).setPlayerID(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            //color: Colors.red,
            child: Text('CLICA AQUI VAI'),
            onPressed: () async {
              
              OneSignal.shared
                  .setInAppMessageClickedHandler((OSInAppMessageAction action) {
                print('Voce clicou em uma InApp notification');
              });

              OneSignal.shared.setEmail(email: 'email@email.com');
              //OneSignal.logoutEmail();
              // Provider.of<HomeController>(context, listen: false)
              //     .store
              //     .iOneSignalNotification
              //     .changeNotificationStatus(true);
              // Provider.of<HomeController>(context, listen: false)
              //     .store
              //     .iOneSignalNotification
              //     .postNotification(['024b641f-95e8-4020-8513-16c9c26427da'], "Conteudo", "Titulo");
            },
          ),
        ),
      ),
    );
  }
}
