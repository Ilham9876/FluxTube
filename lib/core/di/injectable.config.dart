// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fluxtube/application/application.dart' as _i1030;
import 'package:fluxtube/application/channel/channel_bloc.dart' as _i20;
import 'package:fluxtube/application/download/download_bloc.dart' as _i751;
import 'package:fluxtube/application/playlist/playlist_bloc.dart' as _i611;
import 'package:fluxtube/application/saved/saved_bloc.dart' as _i7;
import 'package:fluxtube/application/search/search_bloc.dart' as _i799;
import 'package:fluxtube/application/settings/settings_bloc.dart' as _i112;
import 'package:fluxtube/application/subscribe/subscribe_bloc.dart' as _i187;
import 'package:fluxtube/application/trending/trending_bloc.dart' as _i11;
import 'package:fluxtube/application/watch/watch_bloc.dart' as _i771;
import 'package:fluxtube/domain/channel/channel_services.dart' as _i914;
import 'package:fluxtube/domain/download/download_service.dart' as _i1053;
import 'package:fluxtube/domain/home/home_services.dart' as _i811;
import 'package:fluxtube/domain/home_recommendation/home_recommendation_service.dart'
    as _i72;
import 'package:fluxtube/domain/playlist/playlist_service.dart' as _i117;
import 'package:fluxtube/domain/saved/saved_services.dart' as _i722;
import 'package:fluxtube/domain/search/search_history_service.dart' as _i190;
import 'package:fluxtube/domain/search/search_service.dart' as _i947;
import 'package:fluxtube/domain/settings/settings_service.dart' as _i816;
import 'package:fluxtube/domain/sponsorblock/sponsorblock_service.dart'
    as _i119;
import 'package:fluxtube/domain/subscribes/subscribe_services.dart' as _i479;
import 'package:fluxtube/domain/trending/trending_service.dart' as _i60;
import 'package:fluxtube/domain/user_preferences/user_preferences_service.dart'
    as _i543;
import 'package:fluxtube/domain/watch/watch_service.dart' as _i719;
import 'package:fluxtube/infrastructure/channel/channel_impl.dart' as _i112;
import 'package:fluxtube/infrastructure/download/download_impl.dart' as _i167;
import 'package:fluxtube/infrastructure/home/home_impl.dart' as _i764;
import 'package:fluxtube/infrastructure/home_recommendation/home_recommendation_impl.dart'
    as _i921;
import 'package:fluxtube/infrastructure/playlist/playlist_impl.dart' as _i166;
import 'package:fluxtube/infrastructure/saved/saved_impl.dart' as _i979;
import 'package:fluxtube/infrastructure/search/search_history_impl.dart'
    as _i183;
import 'package:fluxtube/infrastructure/search/search_impl.dart' as _i568;
import 'package:fluxtube/infrastructure/settings/newpipe_data_service.dart'
    as _i611;
import 'package:fluxtube/infrastructure/settings/setting_impl.dart' as _i290;
import 'package:fluxtube/infrastructure/sponsorblock/sponsorblock_impl.dart'
    as _i959;
import 'package:fluxtube/infrastructure/subscribe/subscribe_impl.dart' as _i848;
import 'package:fluxtube/infrastructure/trending/trending_impl.dart' as _i1069;
import 'package:fluxtube/infrastructure/user_preferences/user_preferences_impl.dart'
    as _i992;
import 'package:fluxtube/infrastructure/watch/watch_impl.dart' as _i796;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i611.NewPipeDataService>(
        () => _i611.NewPipeDataService());
    gh.lazySingleton<_i479.SubscribeServices>(() => _i848.SubscribeImpl());
    gh.lazySingleton<_i117.PlaylistService>(() => _i166.PlaylistImpl());
    gh.lazySingleton<_i914.ChannelServices>(() => _i112.ChannelImpl());
    gh.lazySingleton<_i543.UserPreferencesService>(
        () => _i992.UserPreferencesImpl());
    gh.lazySingleton<_i719.WatchService>(() => _i796.WatchImpl());
    gh.lazySingleton<_i947.SearchService>(() => _i568.SearchImpl());
    gh.lazySingleton<_i60.TrendingService>(() => _i1069.TrendingImpl());
    gh.factory<_i611.PlaylistBloc>(
        () => _i611.PlaylistBloc(gh<_i117.PlaylistService>()));
    gh.lazySingleton<_i72.HomeRecommendationService>(
        () => _i921.HomeRecommendationImpl(
              gh<_i543.UserPreferencesService>(),
              gh<_i947.SearchService>(),
            ));
    gh.factory<_i187.SubscribeBloc>(
        () => _i187.SubscribeBloc(gh<_i479.SubscribeServices>()));
    gh.lazySingleton<_i722.SavedServices>(() => _i979.SavedImpl());
    gh.lazySingleton<_i816.SettingsService>(() => _i290.SettingImpl());
    gh.lazySingleton<_i811.HomeServices>(() => _i764.HomeImpl());
    gh.lazySingleton<_i1053.DownloadService>(() => _i167.DownloadImpl());
    gh.lazySingleton<_i119.SponsorBlockService>(() => _i959.SponsorBlockImpl());
    gh.lazySingleton<_i190.SearchHistoryService>(
        () => _i183.SearchHistoryImpl());
    gh.factory<_i799.SearchBloc>(() => _i799.SearchBloc(
          gh<_i947.SearchService>(),
          gh<_i190.SearchHistoryService>(),
        ));
    gh.factory<_i112.SettingsBloc>(
        () => _i112.SettingsBloc(gh<_i816.SettingsService>()));
    gh.factory<_i751.DownloadBloc>(
        () => _i751.DownloadBloc(gh<_i1053.DownloadService>()));
    gh.factory<_i20.ChannelBloc>(
        () => _i20.ChannelBloc(gh<_i914.ChannelServices>()));
    gh.factory<_i771.WatchBloc>(() => _i771.WatchBloc(
          gh<_i719.WatchService>(),
          gh<_i119.SponsorBlockService>(),
        ));
    gh.factory<_i11.TrendingBloc>(() => _i11.TrendingBloc(
          gh<_i1030.SettingsBloc>(),
          gh<_i60.TrendingService>(),
          gh<_i811.HomeServices>(),
          gh<_i1030.SubscribeBloc>(),
          gh<_i72.HomeRecommendationService>(),
        ));
    gh.factory<_i7.SavedBloc>(() => _i7.SavedBloc(
          gh<_i722.SavedServices>(),
          gh<_i543.UserPreferencesService>(),
          gh<_i112.SettingsBloc>(),
        ));
    return this;
  }
}
