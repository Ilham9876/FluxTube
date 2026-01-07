import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/deep_link_handler.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/generated/l10n.dart';

import '../home/screen_home.dart';
import '../saved/screen_saved.dart';
import '../settings/screen_settings.dart';
import '../subscriptions/screen_subscriptions.dart';
import '../trending/screen_trending.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  MainNavigationState createState() => MainNavigationState();
}

class MainNavigationState extends State<MainNavigation> {
  bool _hasShownInstanceFailedSnackbar = false;
  final DeepLinkHandler _deepLinkHandler = DeepLinkHandler();

  List<Widget> _getPages(bool showTrending) {
    if (showTrending) {
      return const [
        ScreenHome(),
        ScreenTrending(),
        ScreenSubscriptions(),
        ScreenSaved(),
        ScreenSettings(),
      ];
    } else {
      return const [
        ScreenHome(),
        ScreenSubscriptions(),
        ScreenSaved(),
        ScreenSettings(),
      ];
    }
  }

  List<TabItem> _getTabItems(S locals, bool showTrending) {
    if (showTrending) {
      return [
        TabItem(icon: CupertinoIcons.house_fill, title: locals.home, key: "home"),
        TabItem(icon: CupertinoIcons.flame_fill, title: locals.trending, key: "trending"),
        TabItem(icon: CupertinoIcons.person_2_fill, title: locals.subscriptions, key: "subscriptions"),
        TabItem(icon: CupertinoIcons.bookmark_fill, title: locals.saved, key: "saved"),
        TabItem(icon: CupertinoIcons.settings, title: locals.settings, key: "settings"),
      ];
    } else {
      return [
        TabItem(icon: CupertinoIcons.house_fill, title: locals.home, key: "home"),
        TabItem(icon: CupertinoIcons.person_2_fill, title: locals.subscriptions, key: "subscriptions"),
        TabItem(icon: CupertinoIcons.bookmark_fill, title: locals.saved, key: "saved"),
        TabItem(icon: CupertinoIcons.settings, title: locals.settings, key: "settings"),
      ];
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _deepLinkHandler.init(context);
    });
  }

  @override
  void dispose() {
    _deepLinkHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.ytService != current.ytService ||
          previous.userInstanceFailed != current.userInstanceFailed,
      builder: (context, settingsState) {
        // All services support trending now
        const showTrending = true;
        final pages = _getPages(showTrending);
        final items = _getTabItems(locals, showTrending);

        final maxIndex = pages.length - 1;

        return BlocListener<SettingsBloc, SettingsState>(
          listenWhen: (previous, current) =>
              !previous.userInstanceFailed && current.userInstanceFailed,
          listener: (context, state) {
            if (state.userInstanceFailed && !_hasShownInstanceFailedSnackbar) {
              _hasShownInstanceFailedSnackbar = true;
              final failedName = state.failedInstanceName ?? 'Your preferred instance';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '$failedName is not responding. Switched to a working instance.',
                  ),
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            }
          },
          child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (BuildContext context, int index, Widget? _) {
              // Ensure index is within bounds
              final safeIndex = index.clamp(0, maxIndex);
              return Scaffold(
                body: SafeArea(
                  child: pages[safeIndex],
                ),
                bottomNavigationBar: BottomBarSalomon(
                  items: items,
                  top: 25,
                  bottom: 25,
                  iconSize: 26,
                  heightItem: 50,
                  backgroundColor: kTransparentColor,
                  color: kGreyColor!,
                  colorSelected: kRedColor,
                  backgroundSelected: kGreyOpacityColor!,
                  indexSelected: safeIndex,
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  onTap: (int index) => indexChangeNotifier.value = index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
