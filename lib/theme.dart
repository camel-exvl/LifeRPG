import "package:flutter/material.dart";

// add text theme here
const textTheme = TextTheme();

class MaterialTheme {
  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff02677d),
      surfaceTint: Color(0xff02677d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb3ebff),
      onPrimaryContainer: Color(0xff001f27),
      secondary: Color(0xff4c626a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcee6f0),
      onSecondaryContainer: Color(0xff061e25),
      tertiary: Color(0xff595c7e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdfe0ff),
      onTertiaryContainer: Color(0xff151937),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff5fafd),
      onBackground: Color(0xff171c1f),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff171c1f),
      surfaceVariant: Color(0xffdbe4e8),
      onSurfaceVariant: Color(0xff40484b),
      outline: Color(0xff70787c),
      outlineVariant: Color(0xffbfc8cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inverseOnSurface: Color(0xffecf1f4),
      inversePrimary: Color(0xff86d1ea),
      primaryFixed: Color(0xffb3ebff),
      onPrimaryFixed: Color(0xff001f27),
      primaryFixedDim: Color(0xff86d1ea),
      onPrimaryFixedVariant: Color(0xff004e5f),
      secondaryFixed: Color(0xffcee6f0),
      onSecondaryFixed: Color(0xff061e25),
      secondaryFixedDim: Color(0xffb3cad4),
      onSecondaryFixedVariant: Color(0xff344a52),
      tertiaryFixed: Color(0xffdfe0ff),
      onTertiaryFixed: Color(0xff151937),
      tertiaryFixedDim: Color(0xffc1c4eb),
      onTertiaryFixedVariant: Color(0xff414465),
      surfaceDim: Color(0xffd6dbdd),
      surfaceBright: Color(0xfff5fafd),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff4f7),
      surfaceContainer: Color(0xffeaeff1),
      surfaceContainerHigh: Color(0xffe4e9ec),
      surfaceContainerHighest: Color(0xffdee3e6),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xff86d1ea),
      surfaceTint: Color(0xff86d1ea),
      onPrimary: Color(0xff003642),
      primaryContainer: Color(0xff004e5f),
      onPrimaryContainer: Color(0xffb3ebff),
      secondary: Color(0xffb3cad4),
      onSecondary: Color(0xff1d333b),
      secondaryContainer: Color(0xff344a52),
      onSecondaryContainer: Color(0xffcee6f0),
      tertiary: Color(0xffc1c4eb),
      onTertiary: Color(0xff2b2e4d),
      tertiaryContainer: Color(0xff414465),
      onTertiaryContainer: Color(0xffdfe0ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff0f1416),
      onBackground: Color(0xffdee3e6),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffdee3e6),
      surfaceVariant: Color(0xff40484b),
      onSurfaceVariant: Color(0xffbfc8cc),
      outline: Color(0xff899296),
      outlineVariant: Color(0xff40484b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inverseOnSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff02677d),
      primaryFixed: Color(0xffb3ebff),
      onPrimaryFixed: Color(0xff001f27),
      primaryFixedDim: Color(0xff86d1ea),
      onPrimaryFixedVariant: Color(0xff004e5f),
      secondaryFixed: Color(0xffcee6f0),
      onSecondaryFixed: Color(0xff061e25),
      secondaryFixedDim: Color(0xffb3cad4),
      onSecondaryFixedVariant: Color(0xff344a52),
      tertiaryFixed: Color(0xffdfe0ff),
      onTertiaryFixed: Color(0xff151937),
      tertiaryFixedDim: Color(0xffc1c4eb),
      onTertiaryFixedVariant: Color(0xff414465),
      surfaceDim: Color(0xff0f1416),
      surfaceBright: Color(0xff343a3c),
      surfaceContainerLowest: Color(0xff0a0f11),
      surfaceContainerLow: Color(0xff171c1f),
      surfaceContainer: Color(0xff1b2023),
      surfaceContainerHigh: Color(0xff252b2d),
      surfaceContainerHighest: Color(0xff303638),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      fontFamily: 'Fusion Pixel 10px Proportional zh_hant Regular');

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      // background: background,
      // onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      // surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
