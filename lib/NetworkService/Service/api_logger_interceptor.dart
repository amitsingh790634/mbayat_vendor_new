import 'dart:convert';

import '../../Utils/AllExport.dart';
import 'curl_logger.dart';

class ApiLoggerInterceptor extends Interceptor {
  final JsonEncoder _encoder = const JsonEncoder.withIndent('  ');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ✅ CURL LOG
    CurlLogger.log(options);

    logDebug("══════════════ 🔵 API REQUEST 🔵 ══════════════");
    logDebug("📍 Base URL     : ${options.baseUrl}");
    logDebug("📌 Endpoint     : ${options.path}");
    logDebug("🔗 Full URL     : ${options.uri}");
    logDebug("📡 Method       : ${options.method}");
    logDebug("📦 Content-Type : ${options.contentType}");
    logDebug("🧩 Extra        : ${options.extra}");

    if (options.headers.isNotEmpty) {
      logDebug("📩 Headers:\n${_encoder.convert(options.headers)}");
    }

    if (options.queryParameters.isNotEmpty) {
      logDebug(
          "🔍 Query Params:\n${_encoder.convert(options.queryParameters)}");
    }

    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;

        logDebug("📤 FormData Fields:");
        for (var field in formData.fields) {
          logDebug("  • ${field.key}: ${field.value}");
        }

        logDebug("📸 FormData Files:");
        for (var file in formData.files) {
          logDebug("  • ${file.key}: ${file.value.filename}");
        }
      } else {
        logDebug("📤 Body:\n${_encoder.convert(options.data)}");
      }
    }

    logDebug("══════════════════════════════════════════════");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug("══════════════ 🟢 API RESPONSE 🟢 ══════════════");
    logDebug("🔗 URL         : ${response.requestOptions.uri}");
    logDebug("📡 Method      : ${response.requestOptions.method}");
    logDebug("🔢 Status Code : ${response.statusCode}");

    if (response.data != null) {
      final pretty = response.data is Map || response.data is List
          ? _encoder.convert(response.data)
          : response.data.toString();
      logDebug("📜 Response:\n$pretty");
    }

    logDebug("══════════════════════════════════════════════");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logDebug("══════════════ 🔴 API ERROR 🔴 ══════════════");
    logDebug("🔗 URL         : ${err.requestOptions.uri}");
    logDebug("📡 Method      : ${err.requestOptions.method}");
    logDebug("❌ Error Type  : ${err.type}");
    logDebug("🔢 Status Code : ${err.response?.statusCode}");
    logDebug("⚠ Message     : ${err.message}");

    if (err.response?.data != null) {
      final pretty = err.response!.data is Map || err.response!.data is List
          ? _encoder.convert(err.response!.data)
          : err.response!.data.toString();
      logDebug("📜 Error Body:\n$pretty");
    }

    logDebug("══════════════════════════════════════════════");
    handler.next(err);
  }
}
