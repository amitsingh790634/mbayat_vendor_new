import 'dart:convert';

import '../../Utils/allExport.dart';

class CurlLogger {
  static void log(RequestOptions options) {
    final buffer = StringBuffer();

    buffer.write('curl -X ${options.method}');

    options.headers.forEach((key, value) {
      buffer.write(" -H '$key: $value'");
    });

    if (options.data != null) {
      final data = options.data is FormData
          ? _formDataToJson(options.data)
          : jsonEncode(options.data);
      buffer.write(" -d '$data'");
    }

    buffer.write(" '${options.uri}'");

    print('🌀 CURL REQUEST:\n$buffer\n');
  }

  static Map<String, dynamic> _formDataToJson(FormData formData) {
    final map = <String, dynamic>{};
    for (var field in formData.fields) {
      map[field.key] = field.value;
    }
    for (var file in formData.files) {
      map[file.key] = file.value.filename;
    }
    return map;
  }
}
