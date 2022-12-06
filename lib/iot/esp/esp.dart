import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stratosfy_esp_ble_provisioning/esp_bluetooth_provisioning.dart';
import 'package:stratosfy_esp_ble_provisioning/models/enums.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? snackbar;

  // PermissionStatus _locationPermissionStatus = PermissionStatus.unknown;
  // final _formKey = GlobalKey<FormState>();
  // var _scaffoldKey = GlobalKey<ScaffoldState>();
  BluetoothState? state;
  bool isScanned = false;
  bool isLoading = false;
  bool securityCheck = false;
  List<BleDevices> devices = [];
  String loading = '';
  String pin = '', ssid = '', password = '';
  StreamSubscription? controller;

  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    devices = [];
    loading = "";
    pin = "";
    ssid = "";
    password = "";
    obscureText = true;
    EspBleProvisioning().requestPermission();
    startListening();
    initPlatformState();
  }

  //
  // @override
  // void dispose() {
  //   /// cancel subscription
  //   controller?.cancel();
  //   super.dispose();
  // }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await EspBleProvisioning.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      print("Platform version : $_platformVersion");
    });
  }

  //*******Listen for bluetooth state***********
  startListening() async {
    print("** Listening **");
    EspBleProvisioning().getBluetoothStateStream().listen((state) async {
      print("State *********** $state");
      if (this.mounted)
        setState(() {
          this.state = state;
        });
      if (state == BluetoothState.ON) {
        if (snackbar != null) {
          snackbar?.close();
        }
        print("Bluetooth ON");
      } else if (state == BluetoothState.OFF) {
        showSnackBar("Please turn on bluetooth.");
      }
    });
  }

  //*******Scan for bluetooth device***********
  scanBleDevice() {
    setState(() {
      isLoading = true;
      loading = "Scanning bluetooth devices";
    });
    controller =
        EspBleProvisioning().scanBluetoothDevice().listen((value) async {
      setState(() {
        if (value.length > 0) {
          print("************DEVICE SCAN RESULT : $value");
          isScanned = true;
          isLoading = false;
          List names = [];
          devices.clear();
          for (int i = 0; i < value.length; i++) {
            if (!names.contains(value[i].name)) {
              devices.add(BleDevices(value[i].name, value[i].id));
            }
            names.add(value[i].name);
          }
        } else {
          isScanned = false;
          isLoading = false;
          showSnackBar("No devices found!");
        }
      });
    });
  }

  //*******Connect to bluetooth device***********
  connectBleDevice(String pin, int index) {
    setState(() {
      print("Connect to Device**************** ${devices[index].name}");
      loading = "Connecting to device";
      isLoading = true;
    });

    controller = EspBleProvisioning()
        .connectToBluetoothDevice(devices[index].name, pin)
        .listen((value) async {
      setState(() {
        if (value == "success") {
          print(value);
          isLoading = false;
          devices.clear();
          print("************security check completed");
        } else {
          isScanned = true;
          isLoading = false;
        }
      });

      _wifiDialog();
    });

    return true;
  }

  //*******Provision device***********
  provisionDevice(String ssid, String password) async {
    setState(() {
      isLoading = true;
      loading = "Provisioning device";
      //todo testing only
      // ssid = "BM_Technovations_24";
      // password = (password == "") ?  "M@n1vannan" : password;
    });
    print("START WIFI PROVISIONING ---> $ssid $password");
    EspBleProvisioning().startProvisioning(ssid, password).then((value) async {
      print("FrontEnd : $value");
      setState(() {
        isLoading = false;
        isScanned = false;
        devices.clear();
        print("Provision Status ----------> $value");
        // showSnackBar(value);
      });
      messageDialog(_getStatusFromKey(value), context);
      return true;
    });
  }

  void showSnackBar(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.red,
        disabledTextColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  void _showPOPDialog(BuildContext _context, int index) {
    showDialog(
        context: _context,
        builder: (BuildContext context) {
          return TextButton(
              onPressed: () {
                print('pin = $pin');
                connectBleDevice(pin, index);
              },
              child: Text('pin Connect'));
        });
  }

  void _wifiDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context, setState) {
            return AlertDialog(
              elevation: 5,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)), //this right here
              content: Container(
                height: 320,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Enter WiFi Credentials',
                          style: Theme.of(context).textTheme.bodyText2),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.all(8),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'ssid*',
                              hintText: 'ssid*',
                            ),
                            // controller: _currentController,
                            onChanged: (value) {
                              ssid = value;
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(top: 8.0, left: 16, right: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password*',
                            hintText: 'Password*',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: Icon(!obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          obscureText: obscureText,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: MaterialButton(
                            child: Text('Provision'),
                            color: Colors.redAccent,
                            onPressed: () {
                              // if (_formKey.currentState.validate())
                              {
                                print('onPressed --->');
                                print('ssid =$ssid, password = $password');
                                provisionDevice(ssid, password);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
          //   WifiDialog(
          //   wifiName:"",
          //   onSubmit: (ssid, password) async {
          //     print('ssid =$ssid, password = $password');
          //     provisionDevice(ssid, password);
          //   },
          // );
        });
  }

  messageDialog(String message, BuildContext _context) {
    showDialog(
      barrierDismissible: true,
      context: _context,
      builder: (BuildContext context) {
        // Future.delayed(Duration(seconds: 5), () {
        //   Navigator.of(context).pop(true);
        // });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Stack(
            children: <Widget>[
              StatefulBuilder(
                builder: (BuildContext context, StateSetter alertState) {
                  return Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Ok",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('Esp Ble Provisioning'),
          ),
          body: !isLoading
              ? isScanned
                  ? Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            "Select a device for provisioning",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: devices.length,
                                itemBuilder: (_context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        _showPOPDialog(context, index);
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                devices[index].name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                devices[index].id,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                }),
                          ),
                        ],
                      ))
                  : Container(
                      height: double.infinity,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => {
                            print("scan clicked"),
                            scanBleDevice()
                            // _wifiDialog()
                          },
                          child: Text("Scan for bluetooth device"),
                        ),
                      ),
                    )
              : Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(top: 250),
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          SpinKitRipple(
                              color: Theme.of(context).backgroundColor),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              loading,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }
}

class BleDevices {
  String name;
  String id;

  BleDevices(this.name, this.id);

  @override
  String toString() {
    return '{ ${this.name}, ${this.id} }';
  }
}

String _getStatusFromKey(ProvisionState key) {
  print(key);
  switch (key) {
    case ProvisionState.CREATE_SESSION_FAILED:
      return "Failed to establish session with device";
    case ProvisionState.WIFI_CONFIG_SENT:
      return "Wifi credentials sent to device";
    case ProvisionState.WIFI_CONFIG_FAILED:
      return "Wifi credentials failed";
    case ProvisionState.WIFI_CONFIG_APPLIED:
      return "Wifi credentials applied to device";
    case ProvisionState.DEVICE_PROVISIONING_SUCCESS:
      return "Device provisioned successfully";
    default:
      return "Device provisioning failed";
  }
}
