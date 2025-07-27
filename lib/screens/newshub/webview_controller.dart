// Simplified WebView controller without Google Sign In
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewAppController {
  late final WebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<String?> error = ValueNotifier(null);

  WebViewAppController({required String initialUrl}) {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => isLoading.value = true,
          onPageFinished: (_) => isLoading.value = false,
          onWebResourceError: (err) {
            if (err.errorType == WebResourceErrorType.hostLookup ||
                err.errorType == WebResourceErrorType.connect ||
                err.errorCode == -2) {
              error.value = err.description;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));
  }

  Future<bool> handleBackPress() async {
    if (await webViewController.canGoBack()) {
      await webViewController.goBack();
      return false;
    }
    return true;
  }

  void retry() {
    error.value = null;
    isLoading.value = true;
    webViewController.reload();
  }

  void dispose() {
    isLoading.dispose();
    error.dispose();
  }
}
