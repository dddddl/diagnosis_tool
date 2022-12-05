import 'package:diagnosis_tool/page/ble_direct_connect/connect_page.dart';
import 'package:diagnosis_tool/page/config/transport/transport_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../page/config/scan/scan_page.dart';
import '../page/config/wifi/wifi_page.dart';
import '../page/home/home_page.dart';

enum AppRoute {
  home,
  connect,
  scan,
  wifi,
  transport,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: '/home',
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/home',
          name: AppRoute.home.name,
          pageBuilder: (context, state) =>
              CupertinoPage(key: state.pageKey, child: HomePage()),
        ),
        GoRoute(
            path: '/connect',
            name: AppRoute.connect.name,
            pageBuilder: (context, state) =>
                CupertinoPage(key: state.pageKey, child: ConnectPage())),
        GoRoute(
            path: '/scan',
            name: AppRoute.scan.name,
            pageBuilder: (context, state) =>
                _slideTransitionPage(state, ScanPage())),
        GoRoute(
            path: '/wifi',
            name: AppRoute.wifi.name,
            pageBuilder: (context, state) =>
                _slideTransitionPage(state, WiFiPage())),
        GoRoute(
            path: '/transport',
            name: AppRoute.transport.name,
            pageBuilder: (context, state) =>
                _slideTransitionPage(state, TransportPage())),
      ]);
});

CustomTransitionPage<dynamic> _slideTransitionPage(
    GoRouterState state, Widget page) {
  return CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });
}
