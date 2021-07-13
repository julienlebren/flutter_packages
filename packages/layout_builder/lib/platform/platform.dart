library platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

bool isMaterial() {
  return defaultTargetPlatform == TargetPlatform.android;
}

bool isCupertino() {
  return defaultTargetPlatform == TargetPlatform.iOS;
}
