abstract class IOneSignalNotification {
  
  initService();
  setNotificationType();
  Future<String> getOneSignalId();
  setExternalID(String externalId);
  removeExternalID();
  openingHandler();
  receiverHandler();
  Future postNotification(List<String> playersIds, String content, String headling);
  Future postNotificationJSON(List<String> playersIds, String content, String headling);
  Future changeNotificationStatus(bool status);

}