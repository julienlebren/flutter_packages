part of ad_manager;

@freezed
class AdSettings with _$AdSettings {
  factory AdSettings({
    @Default(3) maxFailedLoadAttempts,
    String? intersticialMaterial,
    String? intersticialCupertino,
    String? bannerMaterial,
    String? bannerCupertino,
    String? rewardMaterial,
    String? rewardCupertino,
    VoidCallback? updateLastAdsTime,
  }) = _AdSettings;
}
