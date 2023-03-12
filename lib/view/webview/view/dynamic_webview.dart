import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../webview_model.dart';

class DynamicWebView extends StatefulWidget {
  const DynamicWebView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final WebViewModel model;

  @override
  State<DynamicWebView> createState() => _DynamicWebViewState();
}

class _DynamicWebViewState extends State<DynamicWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://drive.google.com/') ||
                request.url.startsWith('https://forms.gle/') ||
                request.url.startsWith('https://docs.google.com/')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.model.url ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title, style: context.textTheme.headlineSmall),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
