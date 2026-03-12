import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:thumbmark_android_flutter/thumbmark_android_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelThumbmarkAndroidFlutter platform =
      MethodChannelThumbmarkAndroidFlutter();
  const MethodChannel channel = MethodChannel('thumbmark_android_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          switch (methodCall.method) {
            case 'getPlatformVersion':
              return '42';
            case 'generateFingerPrintLow':
              return 'low_volatility_mock';
            case 'generateFingerPrintHigh':
              return 'high_volatility_mock';
            default:
              return null;
          }
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('generateFingerPrintLow', () async {
    expect(await platform.generateFingerPrintLow(), 'low_volatility_mock');
  });

  test('generateFingerPrintHigh', () async {
    expect(await platform.generateFingerPrintHigh(), 'high_volatility_mock');
  });
}
