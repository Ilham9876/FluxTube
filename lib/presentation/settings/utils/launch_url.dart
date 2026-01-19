import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/settings/settings_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launch URL with optional external browser mode
/// If [openInBrowser] is true, opens in external browser
/// If false, opens in in-app browser/webview
Future<void> urlLaunch(String url, {bool openInBrowser = false}) async {
  final uri = Uri.parse(url);
  final mode = openInBrowser
      ? LaunchMode.externalApplication
      : LaunchMode.platformDefault;

  if (!await launchUrl(uri, mode: mode)) {
    throw Exception('Could not launch url');
  }
}

/// Launch URL using the openLinksInBrowser setting from context
Future<void> urlLaunchWithSettings(BuildContext context, String url) async {
  final openInBrowser = context.read<SettingsBloc>().state.openLinksInBrowser;
  await urlLaunch(url, openInBrowser: openInBrowser);
}
