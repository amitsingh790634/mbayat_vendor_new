import 'dart:io';

void main() {
  final dir = Directory('assets/l10n');

  if (!dir.existsSync()) {
    print('❌ assets/l10n folder not found');
    return;
  }

  final localeCodes =
      dir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.endsWith('.json'))
          .map((f) => f.uri.pathSegments.last.replaceAll('.json', ''))
          .toList()
        ..sort();

  final buffer = StringBuffer()
    ..writeln("import 'package:flutter/material.dart';\n")
    ..writeln('class AppLocales {')
    ..writeln('  static const List<Locale> supportedLocales = [');

  for (final code in localeCodes) {
    buffer.writeln("    Locale('$code'),");
  }

  buffer
    ..writeln('  ];')
    ..writeln("  static const Locale fallback = Locale('en');")
    ..writeln('}');

  File('lib/utils/app_locales.dart').writeAsStringSync(buffer.toString());

  print('✅ Generated ${localeCodes.length} locales');
}
