library ad_manager;

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:google_mobile_ads/google_mobile_ads.dart' show MobileAds;

part 'src/ad_settings.dart';
part 'src/inline_adaptive.dart';
part 'src/intersticial_container.dart';

part 'ad_manager.freezed.dart';
part 'ad_manager.g.dart';

@riverpod
AdSettings adSettings(AdSettingsRef ref) => throw UnimplementedError();
