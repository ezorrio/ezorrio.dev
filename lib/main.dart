import 'package:ezorrio_dev/Routes.dart';
import 'package:ezorrio_dev/Themes.dart';
import 'package:ezorrio_dev/bloc/appearance/AppearanceCubit.dart';
import 'package:ezorrio_dev/bloc/appearance/AppearanceState.dart';
import 'package:ezorrio_dev/bloc/navigation/NavigationBloc.dart';
import 'package:ezorrio_dev/resource/DataRepository.dart';
import 'package:ezorrio_dev/resource/SettingsRepository.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/widget/BaseLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  NavigationBloc bloc;

  AppRouteObserver({required this.bloc});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      bloc.add(AppPageOpened(routeName: (route.settings.name)!));
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint('did replace');
    if (newRoute is PageRoute) {
      bloc.add(AppPageOpened(routeName: (newRoute.settings.name)!));
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('did pop');

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
          create: (BuildContext context) => AppearanceCubit(
              repository: RepositoryProvider.of<SettingsRepository>(context)),
        ),
      ], child: const App()));

  runApp(app);
}

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'navigator');

  const App({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) =>
      BlocBuilder<AppearanceCubit, AppearanceState>(
        builder: (_, state) => MaterialApp(
          // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          //   DefaultMaterialLocalizations.delegate,
          //   DefaultWidgetsLocalizations.delegate,
          //   DefaultCupertinoLocalizations.delegate,
          // ],
          home: Scaffold(
            body: BaseLayout(
              child: Navigator(
                initialRoute: IntroPage.routeName,
                onGenerateRoute: (settings) => Routes.onGenerateRoute(
                  context: App.navigatorKey.currentContext!,
                  settings: settings,
                ),
                observers: [
                  AppRouteObserver(
                    bloc: BlocProvider.of<NavigationBloc>(context),
                  )
                ],
                key: App.navigatorKey,
              ),
            ),
          ),
          theme: Themes.materialTheme(),
          darkTheme: Themes.materialDarkTheme(),
          themeMode: state.map(
              light: (_) => ThemeMode.light,
              dark: (_) => ThemeMode.dark,
              system: (_) => ThemeMode.system),
        ),
      );
}
