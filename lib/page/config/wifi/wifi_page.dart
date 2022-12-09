import 'package:app_settings/app_settings.dart';
import 'package:diagnosis_tool/page/config/wifi/wifi_provider.dart';
import 'package:diagnosis_tool/router/app_routers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class WiFiPage extends ConsumerStatefulWidget {
  const WiFiPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return WiFiConsumerState();
  }
}

class WiFiConsumerState extends ConsumerState {
  late final TextEditingController _ssidController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _ssidController = TextEditingController();
    _passwordController = TextEditingController();
    ref.read(wifiProvider.notifier).listenWiFiState();
  }

  @override
  void dispose() {
    _ssidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(wifiProvider.select((value) => value.ssid),
        ((previous, next) {
      _ssidController.text = next ?? '';
      _ssidController.selection = TextSelection.fromPosition(
          TextPosition(offset: _ssidController.text.length));
    }));
    ref.listen<String?>(wifiProvider.select((value) => value.password),
        ((previous, next) {
      _passwordController.text = next ?? '';
      _passwordController.selection = TextSelection.fromPosition(
          TextPosition(offset: _passwordController.text.length));
    }));

    // _ssidController.text = ref.watch(wifiProvider.select((value) => value.ssid))??'';

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text('WiFi设置'),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('选择Wi-Fi', style: TextStyle(fontSize: 28))),
                  const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child:
                          Text('此设备只支持使用2.4Ghz的Wi-Fi连接使用\nWi-Fi名称仅支持英文字符及数字')),
                  const SizedBox(height: 48),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.wifi),
                        onPressed: () {
                          AppSettings.openWIFISettings();
                        },
                      ),
                      hintText: '请选择 WIFI',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    controller: _ssidController,
                    onChanged: (value) =>
                        ref.read(wifiProvider.notifier).setSsid(value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      hintText: '请输入 WIFI 密码',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    controller: _passwordController,
                    onChanged: (value) =>
                        ref.read(wifiProvider.notifier).setPassword(value),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                      'WiFi-密码输入错误是最常见的失败原因之一，请仔细核对Wi-Fi密码是否正确\n密码必须至少包含8个字符',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        // 跳转到下一步操作
                        if (!ref
                            .read(wifiProvider.notifier)
                            .isWifiConnected()) {
                          showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text('你没有选择Wi-Fi'),
                                  content: const Text('为了联网成功，请选择家庭Wi-Fi'),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      child: const Text('确定'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });

                          return;
                        }

                        if (ref.read(wifiProvider.notifier).isPasswordEmpty()) {
                          showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text('你没有输入Wi-Fi密码'),
                                  content: const Text('为保证设备安全，不支持连接无密码路由器'),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      child: const Text('确定'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                          return;
                        }

                        if (!ref
                            .read(wifiProvider.notifier)
                            .isPasswordValid()) {
                          showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text('你的Wi-Fi密码不正确'),
                                  content:
                                      const Text('为保证设备安全， Wi-Fi 密码必须至少包含8个字符'),
                                  actions: <Widget>[
                                    CupertinoDialogAction(
                                      child: const Text('确定'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                          return;
                        }

                        context
                            .pushNamed(AppRoute.transport.name, queryParams: {
                          'ssid': _ssidController.text,
                          'password': _passwordController.text,
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF1296DB)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                        fixedSize:
                            MaterialStateProperty.all(const Size(343, 48)),
                      ),
                      child: const Text('下一步'),
                    ),
                  )
                ]),
          ),
        ));
  }
}
