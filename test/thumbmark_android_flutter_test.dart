import 'package:flutter_test/flutter_test.dart';
import 'package:thumbmark_android_flutter/thumbmark_android_flutter.dart';
import 'package:thumbmark_android_flutter/thumbmark_android_flutter_platform_interface.dart';
import 'package:thumbmark_android_flutter/thumbmark_android_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockThumbmarkAndroidFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ThumbmarkAndroidFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ThumbmarkAndroidFlutterPlatform initialPlatform = ThumbmarkAndroidFlutterPlatform.instance;

  test('$MethodChannelThumbmarkAndroidFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelThumbmarkAndroidFlutter>());
  });

  test('getPlatformVersion', () async {
    ThumbmarkAndroidFlutter thumbmarkAndroidFlutterPlugin = ThumbmarkAndroidFlutter();
    MockThumbmarkAndroidFlutterPlatform fakePlatform = MockThumbmarkAndroidFlutterPlatform();
    ThumbmarkAndroidFlutterPlatform.instance = fakePlatform;

    expect(await thumbmarkAndroidFlutterPlugin.getPlatformVersion(), '42');
  });
}
