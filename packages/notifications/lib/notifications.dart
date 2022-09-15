library notifications;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fcmTokenHandlerProvider = Provider<Function(String)>(
  (_) => throw UnimplementedError(),
);

final notificationsServiceProvider = Provider<NotificationsService>(
  (ref) {
    final handler = ref.watch(fcmTokenHandlerProvider);
    return NotificationsService(handler);
  },
  dependencies: [fcmTokenHandlerProvider],
);

class NotificationsService extends StateNotifier<bool> {
  NotificationsService(this._fcmTokenHandler) : super(false);

  final Function(String token) _fcmTokenHandler;

  void register() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != null) {
        _fcmTokenHandler(fcmToken);
      }
      state = true;
    } else {
      state = false;
    }
  }
}
