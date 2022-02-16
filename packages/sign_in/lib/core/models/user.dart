part of '../../sign_in.dart';

@freezed
class BaseUser with _$BaseUser {
  const factory BaseUser({
    @Default(true) bool isComplete,
  }) = _BaseUser;

  factory BaseUser.fromJson(Map<String, dynamic> json) =>
      _$BaseUserFromJson(json);
}
