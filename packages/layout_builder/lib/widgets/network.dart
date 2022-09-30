part of 'widgets.dart';

@freezed
class NetworkErrorSettings with _$NetworkErrorSettings {
  const factory NetworkErrorSettings({
    String? title,
    String? caption,
    String? waiting,
  }) = _NetworkErrorSettings;
}

final networkSettingsProvider = Provider<NetworkErrorSettings>((ref) {
  return const NetworkErrorSettings();
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
    final l10n = ref.watch(layoutLocalizationsProvider);
    print(l10n.toString());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.wifi_exclamationmark, size: 80),
          Text(
            settings.title ?? l10n.networkErrorTitle,
            style: PlatformTextStyle.mediumTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            settings.caption ?? l10n.networkErrorCaption,
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
                settings.waiting ?? l10n.networkErrorWaiting,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
