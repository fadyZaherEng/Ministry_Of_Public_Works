import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/bloc/reports/reports_bloc.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String reportId;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.reportId,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool _isLoading = true;
  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AppBarWidget(
                  title: '',
                  isHaveBackButton: true,
                  imagePath: ImagePaths.arrowBack,
                  isHaveForms: false,
                  onFormsTab: () {},
                  onTap: () {
                    BlocProvider.of<ReportsBloc>(context).add(
                      const ChangeDeviceOrientationEvent(
                        deviceOrientationList: [
                          DeviceOrientation.portraitDown,
                          DeviceOrientation.portraitUp
                        ],
                      ),
                    );
                    Navigator.pop(context);
                  },
                  isHaveDownloadButton: false,
                  onDownloadButton: () {
                    BlocProvider.of<ReportsBloc>(context).add(
                      GetReportPDFEvent(
                        reportId: widget.reportId,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : WebViewWidget(controller: _controller)),
            ],
          ),
        ),
      ),
    );
  }
}
