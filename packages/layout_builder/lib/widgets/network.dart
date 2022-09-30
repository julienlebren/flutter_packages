part of 'widgets.dart';

@freezed
class NetworkErrorSettings with _$NetworkErrorSettings {
  const factory NetworkErrorSettings({
    required String title,
    required String caption,
    required String waiting,
  }) = _NetworkErrorSettings;
}

final networkSettingsProvider = Provider<NetworkErrorSettings>((ref) {
  final l10n = ref.watch(layoutLocalizationsProvider);
  return NetworkErrorSettings(
    title: l10n.networkErrorTitle,
    caption: l10n.networkErrorCaption,
    waiting: l10n.networkErrorWaiting,
  );
});

final connectionStreamProvider = StreamProvider<InternetConnectionStatus>(
  (_) => InternetConnectionChecker().onStatusChange,
);

final connectionStatusProvider = Provider<bool>(
  (ref) {
    final status = ref.watch(connectionStreamProvider);
    return status.maybeWhen(
      data: (status) {
        return status == InternetConnectionStatus.disconnected ? false : true;
      },
      orElse: () => true,
    );
  },
);

class NetWorkError extends ConsumerWidget {
  const NetWorkError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(networkSettingsProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.wifi_exclamationmark, size: 80),
          Text(
            settings.title,
            style: PlatformTextStyle.mediumTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            settings.caption,
            style: PlatformTextStyle.n18,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PlatformActivityIndicator(),
              const SizedBox(width: 10),
              Text(
                settings.waiting,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
