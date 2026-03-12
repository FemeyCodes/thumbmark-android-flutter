import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'thumbmark_android_flutter_method_channel.dart';

abstract class ThumbmarkAndroidFlutterPlatform extends PlatformInterface {
  /// Constructs a ThumbmarkAndroidFlutterPlatform.
  ThumbmarkAndroidFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ThumbmarkAndroidFlutterPlatform _instance = MethodChannelThumbmarkAndroidFlutter();

  /// The default instance of [ThumbmarkAndroidFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelThumbmarkAndroidFlutter].
  static ThumbmarkAndroidFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ThumbmarkAndroidFlutterPlatform] when
  /// they register themselves.
  static set instance(ThumbmarkAndroidFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
