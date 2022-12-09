import 'package:diagnosis_tool/page/ble_direct_connect/connect_page.dart';
import 'package:diagnosis_tool/page/config/prepare/prepare_page.dart';
import 'package:diagnosis_tool/page/config/transport/transport_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../page/config/scan/scan_page.dart';
import '../page/config/wifi/wifi_page.dart';
import '../page/home/home_page.dart';

enum AppRoute {
  home,
  connect,
  prepare,
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
            path: '/prepare',
            name: AppRoute.prepare.name,
            pageBuilder: (context, state) =>
                CupertinoPage(key: state.pageKey, child: const PreparePage())),
        GoRoute(
            path: '/scan',
            name: AppRoute.scan.name,
            pageBuilder: (context, state) =>
                CupertinoPage(key: state.pageKey, child: ScanPage())),
        GoRoute(
            path: '/wifi',
            name: AppRoute.wifi.name,
            pageBuilder: (context, state) =>
                CupertinoPage(key: state.pageKey, child: WiFiPage())),
        GoRoute(
            path: '/transport',
            name: AppRoute.transport.name,
            pageBuilder: (context, state) {
              final ssid = state.queryParams['ssid'];
              final password = state.queryParams['password'];
              return CupertinoPage(
                  key: state.pageKey,
                  child: TransportPage(
                    ssid: ssid,
                    password: password,
                  ));
            }),
      ]);
});
