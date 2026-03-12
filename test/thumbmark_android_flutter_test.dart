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

  @override
  Future<String?> getFingerPrintLow() => Future.value('low_mock');

  @override
  Future<String?> getFingerPrintHigh() => Future.value('high_mock');
}

void main() {
  final ThumbmarkAndroidFlutterPlatform initialPlatform =
      ThumbmarkAndroidFlutterPlatform.instance;

  test('$MethodChannelThumbmarkAndroidFlutter is the default instance', () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelThumbmarkAndroidFlutter>(),
    );
  });

  group('ThumbmarkAndroidFlutter API', () {
    late ThumbmarkAndroidFlutter thumbmarkPlugin;
    late MockThumbmarkAndroidFlutterPlatform fakePlatform;

    setUp(() {
      thumbmarkPlugin = ThumbmarkAndroidFlutter();
      fakePlatform = MockThumbmarkAndroidFlutterPlatform();
      ThumbmarkAndroidFlutterPlatform.instance = fakePlatform;
    });

    test('getPlatformVersion returns correct value', () async {
      expect(await thumbmarkPlugin.getPlatformVersion(), '42');
    });

    test('getFingerPrintLow returns correct value', () async {
      expect(await thumbmarkPlugin.getFingerPrintLow(), 'low_mock');
    });

    test('getFingerPrintHigh returns correct value', () async {
      expect(await thumbmarkPlugin.getFingerPrintHigh(), 'high_mock');
    });
  });
}
