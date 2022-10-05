part of ad_manager;

@freezed
class AdSettings with _$AdSettings {
  factory AdSettings({
    @Default(3) maxFailedLoadAttempts,
    String? intersticialMaterial,
    String? intersticialCupertino,
    String? bannerMaterial,
    String? bannerCupertino,
    String? nativeMaterial,
    String? nativeCupertino,
    VoidCallback? updateLastAdsTime,
  }) = _AdSettings;
}
