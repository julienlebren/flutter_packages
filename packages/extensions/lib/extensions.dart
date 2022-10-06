library extensions;

import 'package:extensions/l10n/extensions_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'src/color.dart';
part 'src/date.dart';
part 'src/int.dart';
part 'src/string.dart';

part 'extensions.g.dart';

@riverpod
ExtensionsLocalizations extensionsLocalizations(
    ExtensionsLocalizationsRef ref) {
  final locale = ref.watch(localeProvider);
  return lookupExtensionsLocalizations(locale);
}
