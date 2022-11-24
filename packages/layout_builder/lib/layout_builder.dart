library layout_builder;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'form/form.dart';
export 'settings/settings.dart';
export 'theme/theme.dart';
export 'platform/platform.dart';
export 'widgets/widgets.dart';

export 'constants/breakpoints.dart';

/// DEV - To put in other files

class UnsupportedPlatformException implements Exception {
  UnsupportedPlatformException();
}

final routeProvider = Provider<RouteFactory>((_) {
  throw UnimplementedError();
});
