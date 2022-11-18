part of '../../sign_in.dart';

class SettingsRoutes {
  static const predicate = 'settings';
  static const settingsAccountPage = 'settings/account';
  static const settingsEmailPage = 'settings/account/email';
  static const settingsPasswordPage = 'settings/account/password';
  static const settingsDeletePage = 'settings/account/delete';
}

class SettingsRouter {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    WidgetRef ref,
  ) {
    ref.read(signInAreaProvider.notifier).state = SignInArea.settings;

    switch (settings.name) {
      case SettingsRoutes.settingsAccountPage:
        return platformPageRoute(
          builder: (_) => const SettingsAccountPage(),
        );
      case SettingsRoutes.settingsEmailPage:
        return platformPageRoute(
          builder: (_) => const SettingsEmailPage(),
        );
      case SettingsRoutes.settingsPasswordPage:
        return platformPageRoute(
          builder: (_) => const SettingsPasswordPage(),
        );
      case SettingsRoutes.settingsDeletePage:
        return platformPageRoute(
          builder: (_) => const SettingsDeletePage(),
        );
    }
    return null;
  }
}
