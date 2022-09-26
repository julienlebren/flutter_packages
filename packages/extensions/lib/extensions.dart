library extensions;

import 'package:extensions/l10n/extensions_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

part 'color.dart';
part 'date.dart';
part 'int.dart';
part 'iterable.dart';
//part 'list.dart';
part 'string.dart';

final extensionsLocalizationsProvider = Provider<ExtensionsLocalizations>(
  (ref) {
    final locale = ref.watch(localeProvider);
    return lookupExtensionsLocalizations(locale);
  },
  dependencies: [localeProvider],
);
