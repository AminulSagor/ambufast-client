import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../combine_service/token_refresh_service.dart';
import '../storage/token_storage.dart';

/// A centralized HTTP client that handles:
/// - Token attachment
/// - Refreshing on expiration
/// - Retrying failed requests
class TokenHttpClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Attach token before sending
    String? accessToken = await TokenStorage.getAccessToken();
    if (accessToken != null) {
      request.headers['Authorization'] = 'Bearer $accessToken';
    }

    http.StreamedResponse response = await _inner.send(request);

    // If expired, attempt refresh and retry
    if (response.statusCode == 401) {
      final body = await response.stream.bytesToString();
      final isExpired = body.contains('Token expired');

      if (isExpired) {
        final refreshed = await TokenAuthService.refreshAccessToken();
        if (refreshed) {
          // Retry original request
          final newAccessToken = await TokenStorage.getAccessToken();

          final retryRequest = http.Request(request.method, request.url)
            ..headers.addAll(request.headers)
            ..bodyBytes = await request.finalize().toBytes();

          retryRequest.headers['Authorization'] = 'Bearer $newAccessToken';
          return _inner.send(retryRequest);
        } else {
          // Redirect to login
          await TokenStorage.clearTokens();
          Get.offAllNamed('/login'); // Update if you use another route name
        }
      }
    }

    return response;
  }
}
