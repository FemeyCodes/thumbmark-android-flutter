import 'thumbmark_android_flutter_platform_interface.dart';

class ThumbmarkAndroidFlutter {
  Future<String?> getPlatformVersion() {
    return ThumbmarkAndroidFlutterPlatform.instance.getPlatformVersion();
  }

  /**
   * Get FingerPrint in Low Volatility(Stable but has possible collsions in some cases)
  */
  Future<String?> getFingerPrintLow() {
    return ThumbmarkAndroidFlutterPlatform.instance.getFingerPrintLow();
  }

  /**
    * Get FingerPrint in High Volatility(No possible collsions but changes easily on small device changes e.g. Font size etc)
  */
  Future<String?> getFingerPrintHigh() {
    return ThumbmarkAndroidFlutterPlatform.instance.getFingerPrintHigh();
  }
}
