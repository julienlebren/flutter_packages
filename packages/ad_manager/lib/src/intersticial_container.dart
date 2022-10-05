part of ad_manager;

final intersticialAdDisplayProvider = Provider<bool>((_) => false);

class InterstitialAdContainer extends ConsumerStatefulWidget {
  const InterstitialAdContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  createState() => _InterstitialAdContainerState();
}

class _InterstitialAdContainerState
    extends ConsumerState<InterstitialAdContainer> with WidgetsBindingObserver {
  InterstitialAd? _interstitialAd;
  int _interstitialLoadAttempts = 0;

  void _createInterstitialAd() {
    final settings = ref.read(adSettingsProvider);
    String adUnitId;

    if (Platform.isAndroid && settings.intersticialMaterial != null) {
      adUnitId = settings.intersticialMaterial!;
    } else if (Platform.isIOS && settings.intersticialCupertino != null) {
      adUnitId = settings.intersticialCupertino!;
    } else {
      return;
    }

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            _interstitialAd = ad;
            _interstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          });
        },
        onAdFailedToLoad: (error) {
          setState(() {
            _interstitialLoadAttempts += 1;
            _interstitialAd = null;
          });
          if (_interstitialLoadAttempts < settings.maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) return;
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        final settings = ref.read(adSettingsProvider);
        if (settings.updateLastAdsTime != null) {
          settings.updateLastAdsTime!();
        }
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    setState(() {
      _interstitialAd = null;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shouldDisplay = ref.watch(intersticialAdDisplayProvider);

    if (shouldDisplay && _interstitialAd != null) {
      return GestureDetector(
        onVerticalDragStart: (_) => _showInterstitialAd(),
        onTap: _showInterstitialAd,
        child: AbsorbPointer(
          absorbing: true,
          child: widget.child,
        ),
      );
    } else {
      return widget.child;
    }
  }
}
