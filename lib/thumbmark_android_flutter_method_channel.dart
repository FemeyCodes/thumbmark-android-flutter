import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'thumbmark_android_flutter_platform_interface.dart';

/// An implementation of [ThumbmarkAndroidFlutterPlatform] that uses method channels.
class MethodChannelThumbmarkAndroidFlutter
    extends ThumbmarkAndroidFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('thumbmark_android_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  Future<String?> generateFingerPrintLow() async {
    final fingerprint = await methodChannel.invokeMethod<String>(
      "generateFingerPrintLow",
    );
    return fingerprint;
  }

  Future<String?> generateFingerPrintHigh() async {
    final fingerprint = await methodChannel.invokeMethod<String>(
      "generateFingerPrintHigh",
    );
    return fingerprint;
  }
}
