import 'dart:io';

import '../../utils/allExport.dart';

class DioClient {
  late final Dio _dio;
  final String baseUrl;

  DioClient({required this.baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 60000),
        sendTimeout: const Duration(milliseconds: 60000),
        headers: {'Accept': 'application/json'},
      ),
    );

    _dio.interceptors.addAll([
      ApiLoggerInterceptor(), // 🔥 CURL + FULL LOGGING
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          /// 🔹 LOADER
          final skipLoader =
              options.extra[ApiExtraKeys.skipLoader] == true ||
              options.extra[ApiExtraKeys.silent] == true;

          if (!skipLoader) loaderNotifier.show();

          /// 🔹 TOKEN
          final token = sharedPrefs?.getString(LocalConfig.sessionToken);
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
        onResponse: (response, handler) {
          loaderNotifier.hide();
          handler.next(response);
        },
        onError: (e, handler) async {
          loaderNotifier.hide();

          /// 🔹 AUTO REFRESH TOKEN
          if (e.response?.statusCode == 401) {
            final refreshed = await _refreshToken();
            if (refreshed) {
              final newToken = sharedPrefs?.getString(LocalConfig.sessionToken);
              e.requestOptions.headers['Authorization'] = 'Bearer $newToken';

              return handler.resolve(await _retry(e.requestOptions));
            }
          }
          handler.next(e);
        },
      ),
    ]);
  }

  // ============================================================
  // 🔁 REFRESH TOKEN
  // ============================================================
  Future<bool> _refreshToken() async {
    try {
      final refreshToken = sharedPrefs?.getString(LocalConfig.refreshToken);
      if (refreshToken == null || refreshToken.isEmpty) return false;

      final res = await _dio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
        options: Options(extra: ApiRequestOptions.silent()),
      );

      if (res.statusCode == 200) {
        sharedPrefs?.setString(
          LocalConfig.sessionToken,
          res.data['accessToken'],
        );
        return true;
      }
      return false;
    } catch (_) {
      SpUtil.clear();
      return false;
    }
  }

  // ============================================================
  // 🔁 RETRY REQUEST
  // ============================================================
  Future<Response> _retry(RequestOptions requestOptions) {
    return _dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
        extra: requestOptions.extra,
      ),
    );
  }

  // ============================================================
  // ✅ GET
  // ============================================================
  Future<ApiResponse> get({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? extras,
  }) async {
    try {
      final res = await _dio.get(
        endPoint,
        queryParameters: query,
        options: Options(extra: extras ?? ApiRequestOptions.normal()),
      );
      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }

  // ============================================================
  // ✅ POST
  // ============================================================
  Future<ApiResponse> post({
    required String endPoint,
    dynamic body,
    Map<String, dynamic>? extras,
  }) async {
    try {
      final res = await _dio.post(
        endPoint,
        data: body,
        options: Options(extra: extras ?? ApiRequestOptions.normal()),
      );
      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }

  // ============================================================
  // ✅ PUT
  // ============================================================
  Future<ApiResponse> put({
    required String endPoint,
    dynamic body,
    Map<String, dynamic>? extras,
  }) async {
    try {
      final res = await _dio.put(
        endPoint,
        data: body,
        options: Options(extra: extras ?? ApiRequestOptions.normal()),
      );
      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }

  // ============================================================
  // ✅ DELETE
  // ============================================================
  Future<ApiResponse> delete({
    required String endPoint,
    dynamic body,
    Map<String, dynamic>? extras,
  }) async {
    try {
      final res = await _dio.delete(
        endPoint,
        data: body,
        options: Options(extra: extras ?? ApiRequestOptions.normal()),
      );
      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }

  // ============================================================
  // 📤 SINGLE FILE UPLOAD
  // ============================================================
  Future<ApiResponse> uploadFile({
    required String endPoint,
    required File file,
    Map<String, dynamic>? data,
    Map<String, dynamic>? extras,
    String fileKey = 'file',
  }) async {
    try {
      final formData = FormData.fromMap({
        ...?data,
        fileKey: await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      final res = await _dio.post(
        endPoint,
        data: formData,
        options: Options(extra: extras ?? ApiRequestOptions.normal()),
      );

      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }

  // ============================================================
  // 📤 MULTIPLE FILE UPLOAD
  // ============================================================
  Future<ApiResponse> uploadMultipleFiles({
    required String endPoint,
    required List<File> files,
    Map<String, dynamic>? data,
    Map<String, dynamic>? extras,
    String fileKey = 'files',
  }) async {
    try {
      final formData = FormData();

      if (data != null) {
        data.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      for (final file in files) {
        formData.files.add(
          MapEntry(
            fileKey,
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }

      final res = await _dio.post(
        endPoint,
        data: formData,
        options: Options(extra: extras ?? ApiRequestOptions.normal()),
      );

      return ApiResponse.success(res);
    } catch (e) {
      return ApiResponse.error(e);
    }
  }
}

/// API Response Handler
class ApiResponse<T> {
  Status? status;
  int? code;
  T? data;
  String? message;

  bool get isSuccess =>
      status == Status.success && (code == 200 || code == 201);

  ApiResponse({this.status, this.code, this.message, this.data});

  factory ApiResponse.success(Response response) {
    return ApiResponse(
      status: Status.success,
      code: response.statusCode,
      message: response.statusMessage,
      data: response.data,
    );
  }

  factory ApiResponse.error(dynamic error) {
    int? code = 0;
    String message = "Something went wrong";

    if (error is DioException) {
      code = error.response?.statusCode;
      message = error.response?.data?['message'] ?? error.message ?? message;
    } else if (error is SocketException) {
      message = "No internet connection";
    }

    return ApiResponse(status: Status.error, code: code, message: message);
  }
}

enum Status { success, error }
