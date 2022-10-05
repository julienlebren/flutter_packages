part of ad_manager;

class InlineAdaptiveAd extends ConsumerStatefulWidget {
  const InlineAdaptiveAd({Key? key}) : super(key: key);

  @override
  createState() => _InlineAdaptiveAdState();
}

class _InlineAdaptiveAdState extends ConsumerState<InlineAdaptiveAd> {
  static const _insets = 16.0;
  AdManagerBannerAd? _inlineAdaptiveAd;
  bool _isLoaded = false;
  AdSize? _adSize;
  late Orientation _currentOrientation;
  double get _adWidth => MediaQuery.of(context).size.width - (2 * _insets);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentOrientation = MediaQuery.of(context).orientation;
    _loadAd();
  }

  void _loadAd() async {
    await _inlineAdaptiveAd?.dispose();
    setState(() {
      _inlineAdaptiveAd = null;
      _isLoaded = false;
    });

    AdSize size = AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
        _adWidth.truncate());

    final settings = ref.read(adSettingsProvider);
    String adUnitId;

    if (Platform.isAndroid) {
      adUnitId = settings.bannerMaterial;
    } else if (Platform.isIOS) {
      adUnitId = settings.bannerCupertino;
    } else {
      return;
    }

    _inlineAdaptiveAd = AdManagerBannerAd(
      adUnitId: adUnitId,
      sizes: [size],
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) async {
          try {
            AdManagerBannerAd bannerAd = (ad as AdManagerBannerAd);
            final AdSize? size = await bannerAd.getPlatformAdSize();
            if (size == null) return;

            setState(() {
              _inlineAdaptiveAd = bannerAd;
              _isLoaded = true;
              _adSize = size;
            });
          } catch (_) {}
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    await _inlineAdaptiveAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (_currentOrientation == orientation &&
            _inlineAdaptiveAd != null &&
            _isLoaded &&
            _adSize != null) {
          return Align(
            child: SizedBox(
              width: _adWidth,
              height: _adSize!.height.toDouble(),
              child: AdWidget(
                ad: _inlineAdaptiveAd!,
              ),
            ),
          );
        }

        if (_currentOrientation != orientation) {
          _currentOrientation = orientation;
          _loadAd();
        }
        return Container();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _inlineAdaptiveAd?.dispose();
  }
}
