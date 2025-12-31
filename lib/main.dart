import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluxtube/application/channel/channel_bloc.dart';
import 'package:fluxtube/application/playlist/playlist_bloc.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/application/saved/saved_bloc.dart';
import 'package:fluxtube/application/search/search_bloc.dart';
import 'package:fluxtube/application/settings/settings_bloc.dart';
import 'package:fluxtube/application/subscribe/subscribe_bloc.dart';
import 'package:fluxtube/application/trending/trending_bloc.dart';
import 'package:fluxtube/application/watch/watch_bloc.dart';
import 'package:fluxtube/core/app_info.dart';
import 'package:fluxtube/core/app_theme.dart';
import 'package:fluxtube/core/locals.dart';
import 'package:fluxtube/infrastructure/settings/setting_impl.dart';
import 'package:fluxtube/presentation/routes/app_routes.dart';
import 'package:fluxtube/presentation/routes/bloc_observer.dart';
import 'package:fluxtube/presentation/watch/widgets/global_pip_overlay.dart';

import 'core/di/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await SettingImpl.initializeDB();
  // Initialize GetIt and register dependencies
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<TrendingBloc>()),
        BlocProvider(create: (context) => getIt<WatchBloc>()),
        BlocProvider(create: (context) => getIt<SearchBloc>()),
        BlocProvider(create: (context) => getIt<SettingsBloc>()),
        BlocProvider(create: (context) => getIt<SavedBloc>()),
        BlocProvider(create: (context) => getIt<SubscribeBloc>()),
        BlocProvider(create: (context) => getIt<ChannelBloc>()),
        BlocProvider(create: (context) => getIt<PlaylistBloc>()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previous, current) =>
            previous.themeMode != current.themeMode ||
            previous.defaultLanguage != current.defaultLanguage,
        builder: (context, state) {
          return MaterialApp.router(
            title: AppInfo.myApp.name,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: _getThemeMode(state.themeMode),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              S.delegate,
            ],
            supportedLocales: supportedLocales,
            locale: Locale(state.defaultLanguage),
            builder: (context, child) {
              return GlobalPipOverlay(
                child: child ?? const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(String themeMode) {
    switch (themeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
