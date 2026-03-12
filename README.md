# Thumbmark Android Flutter

A Flutter plugin for generating device fingerprints on Android. This plugin provides different levels of "volatility" to balance between device uniqueness and stability.

---

## Features

- **Low Volatility Fingerprint**: Generates a stable fingerprint with a lower chance of changing over time, though with a slight possibility of collisions in specific edge cases.
- **High Volatility Fingerprint**: Generates a highly unique fingerprint that is extremely sensitive to device changes (e.g., changes in font size or system settings).

---

## Getting Started

To use this plugin, add `thumbmark_android_flutter` as a dependency in your `pubspec.yaml` file.

### Installation

```yaml
dependencies:
  thumbmark_android_flutter: ^0.0.1
```

---

## Usage

Import the package in your Dart code:

```dart
import 'package:thumbmark_android_flutter/thumbmark_android_flutter.dart';

```

### Initialize the Plugin

Create an instance of the `ThumbmarkAndroidFlutter` class:

```dart
final _thumbmarkPlugin = ThumbmarkAndroidFlutter();

```

### Get Platform Version

```dart
String? version = await _thumbmarkPlugin.getPlatformVersion();

```

### Get Fingerprints

You can choose between stable or highly sensitive fingerprints based on your security requirements:

```dart
// Get a stable fingerprint (Low Volatility)
String? stableFingerprint = await _thumbmarkPlugin.getFingerPrintLow();

// Get a unique, sensitive fingerprint (High Volatility)
String? uniqueFingerprint = await _thumbmarkPlugin.getFingerPrintHigh();

```

---

## Architecture Overview

This plugin follows the **Federated Plugin** pattern:

- **App-Facing Layer**: `ThumbmarkAndroidFlutter` provides the public API.

- **Method Channel**: Handles communication between Dart and the native Android environment.
