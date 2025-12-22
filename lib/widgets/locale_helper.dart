import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocaleHelper {
  static Future<List<Locale>> getSupportedLocales() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final localeFiles = manifestMap.keys
        .where(
            (path) => path.startsWith('assets/l10n/') && path.endsWith('.json'))
        .toList();

    return localeFiles.map((path) {
      final fileName = path.split('/').last.replaceAll('.json', '');
      return Locale(fileName);
    }).toList();
  }
}
