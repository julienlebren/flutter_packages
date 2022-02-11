part of '../../sign_in.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory User({
    String? id,
    String? displayName,
    String? emailAddress,
    @Default(false) bool isComplete,
    @Default(false) bool emailVerified,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
