import 'api_extra_keys.dart';

class ApiRequestOptions {
  static Map<String, dynamic> normal() => {};

  static Map<String, dynamic> skipLoader() => {
        ApiExtraKeys.skipLoader: true,
      };

  static Map<String, dynamic> pagination() => {
        ApiExtraKeys.pagination: true,
        ApiExtraKeys.skipLoader: true,
      };

  static Map<String, dynamic> refresh() => {
        ApiExtraKeys.refresh: true,
        ApiExtraKeys.skipLoader: true,
      };

  static Map<String, dynamic> silent() => {
        ApiExtraKeys.silent: true,
        ApiExtraKeys.skipLoader: true,
      };
}
