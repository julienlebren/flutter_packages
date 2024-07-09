part of 'models.dart';

@freezed
class Language with _$Language {
  const factory Language({
    required String identifier,
    required String name,
    @Default(false) bool isDefault,
  }) = _Language;
}
