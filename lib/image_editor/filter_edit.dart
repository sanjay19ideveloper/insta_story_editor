library flutter_image_filters;

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:flutter_gpu_filters_interface/flutter_gpu_filters_interface.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';


class FlutterImageFilters {
// coverage:ignore-start
  FlutterImageFilters._();

// coverage:ignore-end

  static Iterable<String> get availableFilters =>
      kIsWeb ? const <String>[] : _availableFilters.keys;

  static final Map<String, ShaderConfiguration Function()> _availableFilters = {
    'Brightness': () => BrightnessShaderConfiguration(),
    'Bulge Distortion': () => BulgeDistortionShaderConfiguration(),
    'CGA Colorspace': () => CGAColorspaceShaderConfiguration(),
    'Color Invert': () => ColorInvertShaderConfiguration(),
    'Color Matrix': () => ColorMatrixShaderConfiguration(),
    'Contrast': () => ContrastShaderConfiguration(),
    'Crosshatch': () => CrosshatchShaderConfiguration(),
    'Exposure': () => ExposureShaderConfiguration(),
    'False Color': () => FalseColorShaderConfiguration(),
    'Gamma': () => GammaShaderConfiguration(),
    'Glass Sphere': () => GlassSphereShaderConfiguration(),
    'Grayscale': () => GrayscaleShaderConfiguration(),
    'Halftone': () => HalftoneShaderConfiguration(),
    'Haze': () => HazeShaderConfiguration(),
    'Highlight Shadow': () => HighlightShadowShaderConfiguration(),
    'Hue': () => HueShaderConfiguration(),
    //TODO: 'Kuwahara': () => KuwaharaShaderConfiguration(),
    'Square Lookup Table': () => SquareLookupTableShaderConfiguration(),
    'HALD Lookup Table': () => HALDLookupTableShaderConfiguration(),
    'Luminance Threshold': () => LuminanceThresholdShaderConfiguration(),
    'Luminance': () => LuminanceShaderConfiguration(),
    'Monochrome': () => MonochromeShaderConfiguration(),
    'Opacity': () => OpacityShaderConfiguration(),
    'Pixelation': () => PixelationShaderConfiguration(),
    'Posterize': () => PosterizeShaderConfiguration(),
    'RGB': () => RGBShaderConfiguration(),
    'Saturation': () => SaturationShaderConfiguration(),
    'Solarize': () => SolarizeShaderConfiguration(),
    'Swirl': () => SwirlShaderConfiguration(),
    'Vibrance': () => VibranceShaderConfiguration(),
    'Vignette': () => VignetteShaderConfiguration(),
    'White Balance': () => WhiteBalanceShaderConfiguration(),
    'Zoom Blur': () => ZoomBlurShaderConfiguration(),
  };

//   static ShaderConfiguration? createFilter({required String displayName}) {
//     if (kIsWeb) {
//       return null;
//     }
//     return _availableFilters[displayName]?.call();
//   }

//   static void register<T extends ShaderConfiguration>(
//     Future<FragmentProgram> Function() fragmentProgramProvider, {
//     bool override = false,
//   }) {
//     if (override) {
//       _fragmentPrograms[T] = fragmentProgramProvider;
//     } else {
//       _fragmentPrograms.putIfAbsent(
//         T,
//         () => fragmentProgramProvider,
//       );
//     }
//   }
// }

// class CustomBrightnessConfiguration extends ShaderConfiguration {
//   final NumberParameter _brightness;

//   CustomBrightnessConfiguration()
//       : _brightness = ShaderRangeNumberParameter(
//           'inputBrightness', // uniform name
//           'brightness', // display name
//           0.0,
//           0, // default value
//           min: -1.0, // minimum value
//           max: 1.0, // maximum value
//         ),
//         super([0.0]); // default values

//   // custom setter (optional)
//   set brightness(double value) {
//     _brightness.value = value;
//   }

//   // enlist all parameters
//   @override
//   List<ConfigurationParameter> get parameters => [_brightness];
// }
}