import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppLinksService {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  // Initialize and handle initial link (app was closed)
  Future<void> init(GoRouter router) async {
    // Handle initial link when app was closed and opened via link
    try {
      final initialLink = await _appLinks.getInitialLink();
      if (initialLink != null) {
        debugPrint('Initial link: $initialLink');
        _handleDeepLink(initialLink, router);
      }
    } catch (e) {
      debugPrint('Error handling initial link: $e');
    }

    // Handle links when app is already running
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        debugPrint('Deep link received: $uri');
        _handleDeepLink(uri, router);
      },
      onError: (err) {
        debugPrint('Error listening to link stream: $err');
      },
    );
  }

  // Process and navigate based on deep link
  void _handleDeepLink(Uri uri, GoRouter router) {
    debugPrint('Processing deep link: $uri');
    debugPrint('Scheme: ${uri.scheme}');
    debugPrint('Host: ${uri.host}');
    debugPrint('Path: ${uri.path}');
    debugPrint('Query params: ${uri.queryParameters}');

    // Handle different schemes
    if (uri.scheme == 'myapp' || uri.scheme == 'https') {
      // Map your deep link paths to app routes
      final path = uri.path;

      // Build the navigation path with query parameters
      String targetPath = path;
      if (uri.queryParameters.isNotEmpty) {
        final queryString = uri.queryParameters.entries
            .map((e) => '${e.key}=${e.value}')
            .join('&');
        targetPath = '$path?$queryString';
      }

      // Navigate to the path
      if (targetPath.isNotEmpty) {
        router.go(targetPath);
      }
    }
  }

  // Advanced: Handle specific deep link patterns
  String? parseCustomLink(Uri uri) {
    // Example: myapp://open/profile/123 -> /profile/123
    if (uri.scheme == 'myapp' && uri.host == 'open') {
      return uri.path;
    }

    // Example: https://yourdomain.com/app/products/456 -> /products/456
    if (uri.scheme == 'https' && uri.host == 'yourdomain.com') {
      if (uri.path.startsWith('/app')) {
        return uri.path.replaceFirst('/app', '');
      }
    }

    return uri.path;
  }

  // Cleanup
  void dispose() {
    _linkSubscription?.cancel();
  }
}

// Extension for easier navigation with query params
extension GoRouterExtension on GoRouter {
  void goWithParams(String path, Map<String, String>? queryParams) {
    if (queryParams != null && queryParams.isNotEmpty) {
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${e.value}')
          .join('&');
      go('$path?$queryString');
    } else {
      go(path);
    }
  }
}
