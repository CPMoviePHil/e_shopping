class NotificationModel {
  final int notificationID;
  final int notificationType;
  final String title;
  final String short;
  final String content;
  final String createTime;

  const NotificationModel({
    required this.notificationID,
    required this.notificationType,
    required this.title,
    required this.short,
    required this.content,
    required this.createTime,
  });
}