import 'package:one_signal_test/interfaces/one_signal_notification_interface.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalNotificationService implements IOneSignalNotification {
  @override
  Future changeNotificationStatus(status) async {
    print(status ? "Notificaçao Abilitada" : "Notificaçao Desligada");
    return await OneSignal.shared.setSubscription(status);
  }

  @override
  Future<String> getOneSignalId() async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    var playerId = status.subscriptionStatus.userId;
    print("PlayerID = " + playerId);
    return playerId;
  }

  @override
  initService() {
    return OneSignal.shared.init("SEU-ONESIGNAL-APP-ID",
        iOSSettings: {
          OSiOSSettings.autoPrompt: false,
          OSiOSSettings.inAppLaunchUrl: false
        });
  }

  

  @override
  openingHandler() {
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      var title = result.notification.payload.title; // Titulo
      var content = result.notification.payload.body; //Conteudo
      print("Voce abriu a notificação");
    });
  }

  @override
  receiverHandler() {
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      print('Você recebeu uma notificação');
    });
  }

  @override
  removeExternalID() {
    return OneSignal.shared.removeExternalUserId();
  }

  @override
  setExternalID(String externalId) {
    return OneSignal.shared.setExternalUserId(externalId);
  }

  @override
  Future postNotification(
      List<String> playersIds, String content, String headling) async {
    return await OneSignal.shared.postNotification(OSCreateNotification(
        playerIds: ['ALGUM-PLAYER-ID-AQUI', 'ALGUM-PLAYER-ID-AQUI'],
        content: content,
        heading: headling,
        sendAfter: DateTime.now().add(Duration(seconds: 8)),
        buttons: [
          OSActionButton(
            text: "Button1",
            id: "id1",
          ),
          OSActionButton(text: "Button2", id: "id2")
        ]));
  }

  @override
  setNotificationType() {
    //! Para receber a notificaçao como notificação mesmo.
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
    print('Tipo de notificação escolhido');
  }

  @override
  Future postNotificationJSON(
      List<String> playersIds, String content, String headling) async {
    await OneSignal.shared.postNotificationWithJson({
      "include_external_user_ids": playersIds,
      "contents": {"en": "test conteudo"},
      "headling": {"en": "test titulo"},
    });
  }
}
