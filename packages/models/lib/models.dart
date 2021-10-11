library models;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

@freezed
class Language with _$Language {
  const factory Language({
    required String identifier,
    required String name,
  }) = _Language;
}
