import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void initialize() {
    //Request notification permission
    messaging.requestPermission();

    //Get the token, save it to the database for current user
    messaging.getToken().then((token) {
      print('Token: $token');
    });

    //Handle messages in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message: $message');
    });

    //Handle messages in the background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message: $message');
    });
  }
}
