part of 'models.dart';

@freezed
class SnapFormState with _$SnapFormState {
  const factory SnapFormState.initial() = _Initial;
  const factory SnapFormState.saving() = _Saving;
  const factory SnapFormState.error(String errorText) = _Error;
  const factory SnapFormState.success() = _Success;
}
