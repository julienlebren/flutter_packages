part of ad_manager;

@freezed
class AdSettings with _$AdSettings {
  factory AdSettings({
    @Default(3) maxFailedLoadAttempts,
    @Default(2) hoursBetweenTwoAds,
    required String intersticialMaterial,
    required String intersticialCupertino,
    required String bannerMaterial,
    required String bannerCupertino,
    VoidCallback? updateLastAdsTime,
  }) = _AdSettings;
}
