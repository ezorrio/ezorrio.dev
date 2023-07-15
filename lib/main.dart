import 'package:ezorrio_dev/bloc/appearance/appearance_cubit.dart';
import 'package:ezorrio_dev/bloc/appearance/appearance_state.dart';
import 'package:ezorrio_dev/bloc/navigation/navigation_bloc.dart';
import 'package:ezorrio_dev/resource/data_repository.dart';
import 'package:ezorrio_dev/resource/settings_repository.dart';
import 'package:ezorrio_dev/themes.dart';
import 'package:ezorrio_dev/ui/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  NavigationBloc bloc;

  AppRouteObserver({required this.bloc});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      bloc.add(AppPageOpened(routeName: (route.settings.name)!));
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      bloc.add(AppPageOpened(routeName: (newRoute.settings.name)!));
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    if (previousRoute is PageRoute) {
      bloc.add(AppPageOpened(routeName: (previousRoute.settings.name)!));
    }
  }
}

void main() {
  var app = MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepository>(
          create: (BuildContext context) => SettingsRepository(),
        ),
        RepositoryProvider<DataRepository>(
          create: (BuildContext context) => DataRepository(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<AppearanceCubit>(
          create: (BuildContext context) =>
              AppearanceCubit(repository: RepositoryProvider.of<SettingsRepository>(context)),
        ),
      ], child: const App()));

  runApp(app);
}

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'navigator');

  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver, RouteAware {
  @override
  void didChangePlatformBrightness() {
    // BlocProvider.of<AppearanceCubit>(context).platformThemeChanged();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  // }
  //
  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) => BlocBuilder<AppearanceCubit, AppearanceState>(
        builder: (_, state) => MaterialApp(
          // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          //   DefaultMaterialLocalizations.delegate,
          //   DefaultWidgetsLocalizations.delegate,
          //   DefaultCupertinoLocalizations.delegate,
          // ],
          home: const Scaffold(body: MainPage()),
          theme: Themes.materialTheme(),
          darkTheme: Themes.materialDarkTheme(),
          themeMode: switch (state.appTheme) {
            AppTheme.light => ThemeMode.light,
            AppTheme.dark => ThemeMode.dark,
            AppTheme.system => ThemeMode.system,
          },
        ),
      );
}
