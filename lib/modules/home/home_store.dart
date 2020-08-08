import 'package:mobx/mobx.dart';
import 'package:one_signal_test/interfaces/one_signal_notification_interface.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final IOneSignalNotification iOneSignalNotification;

  _HomeStoreBase({this.iOneSignalNotification});

  @observable
  String playerID;

  @action
  setPlayerID(String value) => playerID = value;

  
}