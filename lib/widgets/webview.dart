import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;

  const WebView(
      {Key? key,
      required this.url,
      required this.title,
      required this.hideAppBar,
      required this.statusBarColor})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webviewReference = FlutterWebviewPlugin();
  late StreamSubscription<String> _onUrlChanged;
  late StreamSubscription<WebViewStateChanged> _onStateChanged;
  late StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();

    webviewReference.close();
    _onUrlChanged = webviewReference.onUrlChanged.listen((String url) {});
    _onStateChanged =
        webviewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          if (_isToMain(state.url)) {
            Navigator.pop(context);
          }
          break;

        default:
          break;
      }
    });
    _onHttpError =
        webviewReference.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onUrlChanged.cancel();
    webviewReference.dispose();
    _onStateChanged.cancel();
    _onHttpError.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor;
    Color backButtonColor;
    if (statusBarColorStr == "FFFFFF") {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: [
          _appBar(Color(int.parse("0xff$statusBarColorStr")), backButtonColor),
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            withJavascript: true,
            // hidden: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text('加载中...'),
              ),
            ),
          ))
        ],
      ),
    );
  }

  _isToMain(String? url) {
    bool contain = false;
    for (var value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  ///*
  ///
  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar) {
      return Container(
        // color: backgroundColor,
        height: 30,
      );
    }
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.close,
                size: 26,
                color: backButtonColor,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: backButtonColor,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
