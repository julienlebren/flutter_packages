import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@Deprecated("Changed to PlatformWidgetBase")
class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key? key,
    required this.androidBuilder,
    required this.iosBuilder,
  }) : super(key: key);

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return iosBuilder(context);
    }
  }
}

abstract class PlatformWidgetBase<MaterialWidget extends Widget,
    CupertinoWidget extends Widget> extends ConsumerWidget {
  const PlatformWidgetBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return createCupertinoWidget(context, ref);
      case TargetPlatform.android:
        return createMaterialWidget(context, ref);
      default:
        return throw UnsupportedError(
            'Platform not supported: $defaultTargetPlatform');
    }
  }

  MaterialWidget createMaterialWidget(BuildContext context, WidgetRef ref);
  CupertinoWidget createCupertinoWidget(BuildContext context, WidgetRef ref);
}
