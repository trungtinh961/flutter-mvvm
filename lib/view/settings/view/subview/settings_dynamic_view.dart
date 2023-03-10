import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';
import 'package:fluttermvvmtemplate/view/settings/model/settings_dynamic.dart';
import 'package:kartal/kartal.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsDynamicView extends StatefulWidget {
  const SettingsDynamicView({Key? key, required this.model}) : super(key: key);
  final SettingsDynamicModel model;

  @override
  State<SettingsDynamicView> createState() => _SettingsDynamicViewState();
}

class _SettingsDynamicViewState extends State<SettingsDynamicView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse(widget.model.url ?? ApplicationConstants.APP_WEB_SITE));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Text(widget.model.title, style: context.textTheme.titleLarge)),
      body: WebViewWidget(controller: _controller),
    );
  }
}
