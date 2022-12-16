import 'package:diagnosis_tool/app/pages/ble_direct_connect/connect_page.dart';
import 'package:diagnosis_tool/app/pages/config/prepare/prepare_page.dart';
import 'package:diagnosis_tool/app/pages/config/scan/scan_page.dart';
import 'package:diagnosis_tool/app/pages/config/success/success_page.dart';
import 'package:diagnosis_tool/app/pages/config/transport/transport_page.dart';
import 'package:diagnosis_tool/app/pages/config/wifi/wifi_page.dart';
import 'package:diagnosis_tool/app/pages/home/home_page.dart';
import 'package:diagnosis_tool/app/pages/robot/robot_page.dart';
import 'package:diagnosis_tool/app/pages/robots/robot_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  connect,
  prepare,
  scan,
  wifi,
  transport,
  success,
  robots,
  robot,
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
        GoRoute(
            path: '/success',
            name: AppRoute.success.name,
            pageBuilder: (context, state) {
              return CupertinoPage(key: state.pageKey, child: SuccessPage());
            }),
        GoRoute(
            path: '/robots',
            name: AppRoute.robots.name,
            pageBuilder: (context, state) {
              return CupertinoPage(key: state.pageKey, child: RobotListPage());
            }),
        GoRoute(
            path: '/robot',
            name: AppRoute.robot.name,
            pageBuilder: (context, state) {
              return CupertinoPage(key: state.pageKey, child: RobotPage());
            }),
      ]);
});
