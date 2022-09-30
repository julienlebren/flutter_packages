part of 'widgets.dart';

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
  const NetWorkError({
    this.title,
    this.caption,
    super.key,
  });

  final String? title;
  final String? caption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.read(layoutLocalizationsProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.wifi_exclamationmark, size: 80),
          Text(
            title ?? l10n.networkErrorTitle,
            style: PlatformTextStyle.mediumTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            caption ?? l10n.networkErrorCaption,
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
                l10n.networkErrorWaiting,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
