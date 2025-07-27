import 'package:advance_it_ltd/screens/newshub/webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewAppController _webController;

  @override
  void initState() {
    super.initState();
    _webController = WebViewAppController(initialUrl: widget.url);
  }

  @override
  void dispose() {
    _webController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _webController.handleBackPress,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(controller: _webController.webViewController),
              ValueListenableBuilder<bool>(
                valueListenable: _webController.isLoading,
                builder: (context, loading, _) {
                  return loading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF065d15),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
