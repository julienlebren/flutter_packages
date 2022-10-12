library notifications;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications.g.dart';

@riverpod
Function(String) fcmTokenHandler(FcmTokenHandlerRef ref) =>
    throw UnimplementedError();

@riverpod
Function(RemoteMessage) messageHandler(MessageHandlerRef ref) =>
    throw UnimplementedError();

final notificationsServiceProvider = Provider.autoDispose<NotificationsService>(
  (ref) {
    final fcmTokenHandler = ref.watch(fcmTokenHandlerProvider);
    final messageHandler = ref.watch(messageHandlerProvider);
    return NotificationsService(fcmTokenHandler, messageHandler);
  },
  dependencies: [
    fcmTokenHandlerProvider,
    messageHandlerProvider,
  ],
);

class NotificationsService extends StateNotifier<bool> {
  NotificationsService(
    this._fcmTokenHandler,
    this._messageHandler,
  ) : super(false);

  final Function(String token) _fcmTokenHandler;
  final Function(RemoteMessage initialMessage) _messageHandler;

  void register() async {
    try {
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
    } catch (_) {
      state = false;
    }
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _messageHandler(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_messageHandler);
  }
}
