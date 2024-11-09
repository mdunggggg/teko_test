import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../../env/env_config.dart';
import 'dio_logger.dart';
import 'interceptor.dart';

class ApiService extends DioMixin {
  ApiService._internal() {
    options = BaseOptions(
      baseUrl: EnvironmentConfig.BASE_URL_HTTP,
      connectTimeout: const Duration(milliseconds: 30000),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    interceptors.addAll([
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
      CurlLoggerDioInterceptor(
        printOnSuccess: true,
      ),
      ApiInterceptor(),
      RetryInterceptor(
        dio: this,
        retries: 3,
        logPrint: print,
        retryDelays: [
          const Duration(seconds: 1),
          const Duration(seconds: 2),
          const Duration(seconds: 3),
        ],
      ),
    ]);
    httpClientAdapter = IOHttpClientAdapter();
  }

  factory ApiService() => ApiService._internal();

  @override
  Future<Response<T>> fetch<T>(RequestOptions requestOptions) async {
    try {
      final Response<T> res = await super.fetch(requestOptions);
      return res;
    } on DioException catch (e) {
      throw e.error ?? e;
    }
  }
}
