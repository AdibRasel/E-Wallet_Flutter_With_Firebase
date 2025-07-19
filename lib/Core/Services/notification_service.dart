import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// NotificationService ক্লাস যেখানে আমরা notification initialize এবং handle করবো
class NotificationService {
  // FlutterLocalNotificationsPlugin এর instance নিচ্ছি
  final FlutterLocalNotificationsPlugin notificationPlugin =
      FlutterLocalNotificationsPlugin();

  // Notification initialize করার ফাংশন
  Future<void> initNotification() async {
    // Android এবং iOS এর জন্য InitializationSettings সেট করছি
    final InitializationSettings
    initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        "mitmap/ic_launcher",
      ), // Android এর notification icon
      iOS: DarwinInitializationSettings(
        requestAlertPermission:
            true, // iOS এ alert notification এর permission চাচ্ছে
        requestBadgePermission: true, // iOS এ badge দেখানোর permission চাচ্ছে
        requestSoundPermission: true, // iOS এ sound বাজানোর permission চাচ্ছে
      ),
    );

    // notificationPlugin initialize করছি এবং tap করলে কোন function call হবে সেটাও দিচ্ছি
    await notificationPlugin.initialize(
      initializationSettings,
      // Notification এ tap করলে এই function call হবে
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Notification ক্লিক করার পর এখানে কাজ করতে পারো
      },
      // App বন্ধ থাকলেও notification ক্লিক করলে এই function call হবে
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  Future showNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
  }) async {
    return notificationPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName"),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }
}

// এই function টি app বন্ধ থাকা অবস্থায় notification এ ক্লিক করলে কাজ করবে
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  // background এ notification tap করলে এখানে কাজ করতে পারো
}
