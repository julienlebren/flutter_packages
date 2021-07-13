import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_builder/platform/platform.dart';

Page platformPage({
  required Widget child,
}) {
  if (isMaterial()) {
    return MaterialPage(
      child: child,
    );
  } else {
    return CupertinoPage(
      child: child,
    );
  }
}
