import 'package:ezorrio_dev/Routes.dart';
import 'package:ezorrio_dev/Themes.dart';
import 'package:ezorrio_dev/bloc/appearance/AppearanceBloc.dart';
import 'package:ezorrio_dev/bloc/navigation/NavigationBloc.dart';
import 'package:ezorrio_dev/resource/SettingsRepository.dart';
import 'package:ezorrio_dev/ui/page/IntroPage.dart';
import 'package:ezorrio_dev/ui/widget/AppWidgets.dart';
import 'package:ezorrio_dev/ui/widget/DrawerLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    if (route is PopupRoute) {
      bloc.add(AppPopupOpened(
          isPreviousPopup: previousRoute is PopupRoute,
          previousRoute: previousRoute));
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
    if (route is PopupRoute) {
      bloc.add(AppPopupClosed());
    }
    if (previousRoute is PopupRoute) {
      bloc.add(AppPopupOpened(
          isPreviousPopup: route is PopupRoute, previousRoute: previousRoute));
    }
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('(${bloc.runtimeType}): ${event.toString()}');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('(${bloc.runtimeType}): ${transition.toString()}');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType}, ${stackTrace.toString()}');
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  var app = MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepository>(
          create: (BuildContext context) => SettingsRepository(),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => NavigationBloc(),
        ),
        BlocProvider<AppearanceBloc>(
          create: (BuildContext context) => AppearanceBloc(
              repository: RepositoryProvider.of<SettingsRepository>(context)),
        ),
      ], child: App()));

  runApp(app);
}

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: 'navigator');

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver, RouteAware {
  @override
  void didChangePlatformBrightness() {
    BlocProvider.of<AppearanceBloc>(context).add(PlatformThemeChanged());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AppearanceBloc, AppearanceState>(
        builder: (_, state) => Theme(
          data: state.theme == AppTheme.LIGHT
              ? Themes.materialTheme()
              : state.theme == AppTheme.DARK
                  ? Themes.materialDarkTheme()
                  : MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                              .platformBrightness ==
                          Brightness.light
                      ? Themes.materialTheme()
                      : Themes.materialDarkTheme(),
          child: MaterialApp(
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            home: Scaffold(
              body: DrawerLayout(
                child: Navigator(
                  initialRoute: IntroPage.routeName,
                  onGenerateRoute: (settings) => Routes.onGenerateRoute(
                      context: App.navigatorKey.currentContext!,
                      settings: settings),
                  observers: [
                    AppRouteObserver(
                        bloc: BlocProvider.of<NavigationBloc>(context))
                  ],
                  key: App.navigatorKey,
                ),
              ),
              persistentFooterButtons: [
                AppWidgets.themeChooser(context: context),
                Container(
                  height: 48,
                  child: VerticalDivider(width: 1, indent: 4, endIndent: 4),
                ),
                AppWidgets.poweredByFlutter(context: context),
              ],
            ),
            theme: Themes.materialTheme(),
            darkTheme: Themes.materialDarkTheme(),
            themeMode: state.theme == AppTheme.LIGHT
                ? ThemeMode.light
                : state.theme == AppTheme.DARK
                    ? ThemeMode.dark
                    : ThemeMode.system,
          ),
        ),
      );
}
