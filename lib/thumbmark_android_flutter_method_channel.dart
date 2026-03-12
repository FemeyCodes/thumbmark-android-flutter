import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'thumbmark_android_flutter_platform_interface.dart';

/// An implementation of [ThumbmarkAndroidFlutterPlatform] that uses method channels.
class MethodChannelThumbmarkAndroidFlutter extends ThumbmarkAndroidFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('thumbmark_android_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
