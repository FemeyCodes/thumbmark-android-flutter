
import 'thumbmark_android_flutter_platform_interface.dart';

class ThumbmarkAndroidFlutter {
  Future<String?> getPlatformVersion() {
    return ThumbmarkAndroidFlutterPlatform.instance.getPlatformVersion();
  }
}
